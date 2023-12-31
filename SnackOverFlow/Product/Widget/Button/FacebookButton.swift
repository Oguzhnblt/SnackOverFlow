//
//  FacebookButton.swift
//  SnackOverFlow
//
//  Created by Oğuz on 3.09.2023.
//

import SwiftUI


struct FacebookButton: View {
    var onTap: () -> Void
    var body: some View {
        Button {
            onTap()
        } label: {
            HStack {
                Image(IconItems.Social.facebookLogo.rawValue)
                Text(LocalKeys.Auth.facebook.rawValue.locale())
                Spacer()
            }
            .tint(.white)
            .font(.title2)
            .padding(.all,PagePadding.All.normal.rawValue)
        }
        .buttonBorderShape(.roundedRectangle)
        .controlSize(.large)
        .background(Color.deepSkyBlue)
        .cornerRadius(RadiusItems.radius)
    }
}

struct FacebookButton_Previews: PreviewProvider {
    static var previews: some View {
        FacebookButton(onTap: {})
    }
}
