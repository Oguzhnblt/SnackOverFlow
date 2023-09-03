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
}

extension String {
    /// It localize any string from Localizable.strings
    /// - Returns: Localized value
    func locale() -> LocalizedStringKey {
        return LocalizedStringKey(self)
    }
}
