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
            BodyView()
        }
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView().ignoresSafeArea()
    }
}

private struct BodyView: View {
    var body: some View {
        GeometryReader { geometry in
            VStack {
                Spacer()
                Image(IconItems.Social.appLogo.rawValue)
                Spacer()
                FacebookButton(onTap: {}).padding(Edge.Set.top, PagePadding.All.normal.rawValue)
                GoogleButton(onTap: {})
                AppleButton(onTap: {})
                Divider()
                    .background(Color.peach)
                    .frame(width: geometry.dynamicWidth(width: 0.6),height: ViewSize.DividerSize.normal)
                    .padding(.all, PagePadding.All.normal.rawValue)
                EmailButton(onTap: {})
                Spacer().frame(height: geometry.dynamicHeight(height: 0.1))
            }
            .padding(.paddingAll)
        }
    }
}
