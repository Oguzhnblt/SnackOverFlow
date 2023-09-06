//
//  TextFieldModifier.swift
//  SnackOverFlow
//
//  Created by Oğuz on 6.09.2023.
//

import SwiftUI

struct TextFieldModifier: ViewModifier {
    func body(content: Content) -> some View {
        return content.padding()
            .overlay(RoundedRectangle(cornerRadius:8)
                .stroke(lineWidth: 2)
            )
            .foregroundColor(Color.karl)
    }
}
