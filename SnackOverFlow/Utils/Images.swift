//
//  Images.swift
//  SnackOverFlow
//
//  Created by Oğuz on 3.09.2023.
//

import Foundation
import SwiftUI

enum Images: String {
    
    case juice = "img_juice"
}

struct ImageItems {
    
    enum Authentication: String {
        case login = "img_volcano"
    }
}

extension String {
    func image() -> Image {
        return Image(self)
    }
}
