//
//  LoginView.swift
//  SnackOverFlow
//
//  Created by Oğuz on 3.09.2023.
//

import SwiftUI

struct LoginView: View {
    var body: some View {
        VStack(spacing: PagePadding.All.normal.rawValue) {
            Spacer()
            
            ImageItems.Authentication.login.rawValue.image()
            Text(LocalKeys.Login.welcomeBack.rawValue)
                .foregroundColor(.teflon)
                .font(.system(size: FontSizes.title1, weight: .semibold))
            
            LoginMailView(iconName: IconItems.mail, hint: LocalKeys.General.emailHint.rawValue)
            LoginPasswordView(iconName: IconItems.lock, hint: LocalKeys.General.passwordlHint.rawValue)
            Divider()
            NormalButton(title:LocalKeys.Login.createAccount.rawValue, onTap: {})
            PrivacyTextView()
            Spacer()
        }
        .padding(.all, PagePadding.All.normal.rawValue)
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
