//
//  WelcomeView.swift
//  SnackOverFlow
//
//  Created by Oğuz on 3.09.2023.
//

import SwiftUI

struct WelcomeView: View {
    var body: some View {
        ZStack {
            Image(Images.juice.rawValue)
                .resizable()
            Color.black_30 // with opacity color (0.3 -> 30)
            VStack {
                Image(IconItems.Social.appLogo.rawValue)
                FacebookButton(onTap: {}).padding(Edge.Set.top, 40)
            }
            .padding(.paddingAll)
        }
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView().ignoresSafeArea()
    }
}

extension EdgeInsets {
    
    static let paddingAll = EdgeInsets.init(top: 10, leading: 10, bottom: 10, trailing: 10)
}
