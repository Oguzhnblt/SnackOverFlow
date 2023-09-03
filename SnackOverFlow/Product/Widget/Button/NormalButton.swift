//
//  NormalButton.swift
//  SnackOverFlow
//
//  Created by Oğuz on 3.09.2023.
//

import SwiftUI

/// It's a normal button for project
///
/// [onTap] will return user interaction
/// [title] it shows button name
///
struct NormalButton: View {
    var title: String
    var onTap: () -> Void
    var body: some View {
        Button {
            onTap()
        } label: {
            HStack {
                Spacer()
                Text(title.locale())
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
}

struct NormalButton_Previews: PreviewProvider {
    static var previews: some View {
        NormalButton(title: "Sample", onTap: {})
    }
}
