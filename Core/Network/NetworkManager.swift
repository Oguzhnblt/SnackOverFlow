//
//  NetworkManager.swift
//  SnackOverFlow
//
//  Created by Oğuz on 6.09.2023.
//

import Alamofire


struct NetworkConfig {
    let baseURL: String
}

protocol INetworkManager {
    var config: NetworkConfig {get}
    
    func fetch<T: Codable>(path: NetworkPath, method: HTTPMethod, type: T.Type) async -> T?
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
}

enum NetworkPath: String {
    
    case users = "api/users"
    static let baseURLRegres: String = "https://reqres.in/"
    
}
