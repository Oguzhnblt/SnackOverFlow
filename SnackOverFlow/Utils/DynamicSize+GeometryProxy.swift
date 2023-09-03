//
//  DynamicSize+GeometryProxy.swift
//  SnackOverFlow
//
//  Created by Oğuz on 3.09.2023.
//

import SwiftUI

extension GeometryProxy {
    func dynamicHeight(height: Double) -> Double {
        return size.height * height
    }
    
    func dynamicWidth(width: Double) -> Double {
        return size.width * width
    }
}
