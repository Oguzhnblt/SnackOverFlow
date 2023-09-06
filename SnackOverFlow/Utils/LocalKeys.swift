//
//  LocalKeys.swift
//  SnackOverFlow
//
//  Created by Oğuz on 3.09.2023.
//

import SwiftUI

struct LocalKeys {
    
    enum Auth: String {
        
        case facebook = "signInFacebook"
        case google = "signInGoogle"
        case apple = "signInApple"
        case custom = "signupWithEmail"
    }
    
    enum Button: String {
        case getStarted = "getStarted"
    }
    
    enum Login: String {
        case welcomeBack = "Welcome Back!"
        case createAccount = "Create Account"
        case terms = "By clicking \"Create account\", I agree to SnackOverflow's [TOS](google.com) and [Privacy Policy](google.com)"
    }
    
    enum General: String {
        case emailHint = "Write your email"
        case passwordlHint = "Write your password"
    }
}

extension String {
    /// It localize any string from Localizable.strings
    /// - Returns: Localized value
    func locale() -> LocalizedStringKey {
        return LocalizedStringKey(self)
    }
}
