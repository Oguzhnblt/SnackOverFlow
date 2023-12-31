//
//  LoginView.swift
//  SnackOverFlow
//
//  Created by Oğuz on 3.09.2023.
//

import SwiftUI

struct LoginView: View {
    
    @ObservedObject private var viewModel = LoginViewModel()
    
    var body: some View {
        NavigationView {
            VStack(spacing: PagePadding.All.normal.rawValue) {
                Spacer()
                ImageItems.Authentication.login.rawValue.image()
                Text(LocalKeys.Login.welcomeBack.rawValue)
                    .foregroundColor(.teflon)
                    .font(.system(size: FontSizes.title1, weight: .semibold))
                
                LoginMailView(iconName: IconItems.mail, hint: LocalKeys.General.emailHint.rawValue, text: $viewModel.emailValue)
                
                LoginPasswordView(iconName: IconItems.lock, hint: LocalKeys.General.passwordlHint.rawValue, text: $viewModel.passwordValue)
                
                Divider()
                NavigationLink("", isActive: $viewModel.isLogged) {
                    Text("Hello")
                        .navigationBarBackButtonHidden(true)
                }
                Group {
                    NormalButton(title:LocalKeys.Login.createAccount.rawValue, onTap: {
                        Task {
                            await viewModel.onloignUser()
                        }
                    })
                    
                    PrivacyTextView()
                    
                    Spacer()
                }
            }
            .padding(.all, PagePadding.All.normal.rawValue)
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
