//
//  NetworkManager.swift
//  SnackOverFlow
//
//  Created by Oğuz on 6.09.2023.
//

import Alamofire
import Foundation


struct NetworkConfig {
    let baseURL: String
}

enum NetworkPath: String {
    
    case users = "api/users"
    case login = "api/login"
    static let baseURLRegres: String = "https://reqres.in/"
    
}

protocol INetworkManager {
    var config: NetworkConfig {get}
    
    func fetch<T: Codable>(path: NetworkPath, method: HTTPMethod, type: T.Type) async -> T?
    func post<T: Codable, R: Encodable>(path: NetworkPath, model: R, type: T.Type) async -> T?
}

extension NetworkManager {
    static let networkManager: INetworkManager = NetworkManager(config: NetworkConfig(baseURL: NetworkPath.baseURLRegres))
}

class NetworkManager: INetworkManager{
    
    internal var config: NetworkConfig
    
    init(config: NetworkConfig) {
        self.config = config
    }
    
    func fetch<T: Codable>(path: NetworkPath, method: HTTPMethod, type: T.Type) async -> T?{
        let dataRequest = AF.request("\(config.baseURL)\(path.rawValue)", method: method)
            .validate()
            .serializingDecodable(T.self)
        
        let result = await dataRequest.response
        
        guard let value = result.value else {
            print("Error:\(String(describing: result.error))")
            return nil
        }
        
        return value
    }
    
    func post<T: Codable, R: Encodable>(path: NetworkPath, model: R, type: T.Type) async -> T? {
        let jsonEncoder = JSONEncoder()
        guard let data = try? jsonEncoder.encode(model) else { return nil }
        guard let dataString = String(data: data, encoding: .utf8) else {return nil}
        
        let dataRequest = AF.request("\(config.baseURL)\(path.rawValue)", method: .post, parameters: convertToDictionary(text: dataString))
            .validate()
            .serializingDecodable(T.self)
        let result = await dataRequest.response
        
        guard let value = result.value else {
            print("Error: \(String(describing: result.error))")
            return nil
        }
        
        return value
    }
    
    
    // Dönüşüm Fonksiyonu
    private func convertToDictionary(text: String) -> [String: Any]? {
        if let data = text.data(using: .utf8) {
            do {
                return try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
            } catch {
                print(error.localizedDescription)
            }
        }
        return nil
    }
}
