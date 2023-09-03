//
//  EmailButton.swift
//  SnackOverFlow
//
//  Created by Oğuz on 3.09.2023.
//

import SwiftUI

struct EmailButton: View {
    var onTap: () -> Void
    var body: some View {
        Button {
            onTap()
        } label: {
            HStack {
                Spacer()
                Text(LocalKeys.Auth.custom.rawValue.locale())
                Spacer()
            }
            .tint(.white)
            .font(.bold(.headline)())
            .padding(.all,PagePadding.All.normal.rawValue)
        }
        .buttonBorderShape(.roundedRectangle)
        .controlSize(.large)
        .background(Color.peach)
        .cornerRadius(RadiusItems.radius)
    }
    
    struct EmailButton_Previews: PreviewProvider {
        static var previews: some View {
            EmailButton(onTap: {})
        }
    }
}
