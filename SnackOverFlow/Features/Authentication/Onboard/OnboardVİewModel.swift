//
//  OnboardVİewModel.swift
//  SnackOverFlow
//
//  Created by Oğuz on 6.09.2023.
//

import Foundation

final class OnboardViewModel: ObservableObject {
    
    @Published var currentIndex: Int = 0
    @Published var isHomeRedirect: Bool = false
    
    private let cache = UserDefaultsCache()
    
    private func isUserFirstLogin() -> Bool {
        return cache.read(key: .onboard).isEmpty
        
    }
    
    private func checkUserFirstTime() {
        guard !isUserFirstLogin() else {
            uptadeCacheFirstLogin()
            return
        }
        redirectToHome()
    }
    
     func saveUserLoginAndRedirect() {
        uptadeCacheFirstLogin()
        redirectToHome()
        
    }
    
    private func redirectToHome() {
        isHomeRedirect = true
    }
    
    private func uptadeCacheFirstLogin() {
        cache.save(key: .onboard, value: "Okay!")
    }
    
    private func removeCacheFirstLogin() {
        cache.remove(key: .onboard)
    }
}
