//
//  LoginViewComponents.swift
//  SnackOverFlow
//
//  Created by Oğuz on 6.09.2023.
//

import SwiftUI

struct PrivacyTextView: View {
    var body: some View {
        Text(LocalKeys.Login.terms.rawValue.locale())
            .environment (\ . openURL, OpenURLAction (handler: { url in print (url); return .discarded}))
            .foregroundColor(.gandalf)
            .font(.system(size: 12))
    }
}

 struct LoginMailView: View {
    let iconName: String
    let hint: String
    var text: Binding<String>
    var body: some View {
        HStack {
            iconName.image()
            TextField(hint, text: text)
        }
        .modifier(TextFieldModifier())
    }
}

struct LoginPasswordView: View {
    
    let iconName: String
    let hint: String
    var text: Binding<String>
    var body: some View {
        HStack {
            iconName.image()
            SecureField(hint, text: text)
        }
        .modifier(TextFieldModifier())
    }
}
