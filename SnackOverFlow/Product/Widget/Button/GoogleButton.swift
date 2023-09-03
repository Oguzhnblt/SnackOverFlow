//
//  GoogleButton.swift
//  SnackOverFlow
//
//  Created by Oğuz on 3.09.2023.
//

import SwiftUI

struct GoogleButton: View {
    var onTap: () -> Void
    var body: some View {
        Button {
            onTap()
        } label: {
            HStack {
                Image(IconItems.Social.googleLogo.rawValue)
                Text(LocalKeys.Auth.google.rawValue.locale())
                Spacer()
            }
            .tint(.black)
            .font(.title2)
            .padding(.all,PagePadding.All.normal.rawValue)
        }
        .buttonBorderShape(.roundedRectangle)
        .controlSize(.large)
        .background(Color.white)
        .cornerRadius(RadiusItems.radius)

    }
    
    struct GoogleButton_Previews: PreviewProvider {
        static var previews: some View {
            GoogleButton(onTap: {})
        }
    }
}
