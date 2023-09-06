//
//  LoginViewModel.swift
//  SnackOverFlow
//
//  Created by Oğuz on 7.09.2023.
//

import Foundation

final class LoginViewModel: ObservableObject {
    
    @Published var emailValue: String = "eve.holt@reqres.in"
    @Published var passwordValue: String = "cityslicka"
    @Published var token: String = ""
    @Published var isLogged: Bool = false
    
    let networkManager = NetworkManager(config: NetworkConfig(baseURL: NetworkPath.baseURLRegres))
    
    func onloignUser() async {
        
        token = await onloginUser(email: emailValue, password: passwordValue)
        isLogged = !token.isEmpty
    }
}

protocol LoginUseCase {
    func onloginUser(email: String, password: String) async -> String
    func onSaveUserToken(token: String)  -> Bool
}

extension LoginViewModel: LoginUseCase {
    func onloginUser(email: String, password: String) async -> String {
        guard !email.isEmpty else {return ""}
        guard !password.isEmpty else {return ""}
        
        let response = await networkManager.post(path: .login, model: LoginRequest(email: emailValue, password: passwordValue), type: LoginResponse.self)
        
        return response?.token ?? "Error"
    }
    
    func onSaveUserToken(token: String) -> Bool {
        
        // TODO: Database Generic
        return true
    }
}
