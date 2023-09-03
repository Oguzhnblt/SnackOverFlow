//
//  OnboardModel.swift
//  SnackOverFlow
//
//  Created by Oğuz on 3.09.2023.
//

import Foundation

struct OnboardModel: Identifiable {
    
    var id: UUID = UUID()
    
    let imageName: String
    let description: String
    
    static let items: [OnboardModel] = [
    OnboardModel(imageName: "img_hand", description: "Hand-pickle high quality snacks."),
    OnboardModel(imageName: "img_shop", description: "Shop global. Mind-blownly affordable."),
    OnboardModel(imageName: "img_deliver", description: "Deliver on the promise of time."),
    
    ]
}
