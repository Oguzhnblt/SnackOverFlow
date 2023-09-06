//
//  OnboardView.swift
//  SnackOverFlow
//
//  Created by Oğuz on 3.09.2023.
//

import SwiftUI

struct OnboardView: View {
    
    @StateObject var onboardViewModel = OnboardViewModel()
    private let pageCount = OnboardModel.items.count // Sayfa sayısı
    
    var body: some View {
        NavigationView  {
            GeometryReader { geometry in
                VStack {
                    Spacer()
                    TabView(
                        selection: $onboardViewModel.currentIndex,
                        content: {
                            ForEach(0..<pageCount, id: \.self) { value in
                                SliderCard(model: OnboardModel.items[value], imageHeight: geometry.dynamicHeight(height: 0.45))
                            }
                        })
                    .tabViewStyle(.page(indexDisplayMode: .never))
                    
                    Spacer()
                    HStack {
                        PageIndicatorView(currentIndex: $onboardViewModel.currentIndex, pageCount: pageCount)
                    }
                    .frame(height: ViewHeight.indicator)
                    
                    NavigationLink(isActive: $onboardViewModel.isHomeRedirect) {
                        WelcomeView().ignoresSafeArea()
                    } label: {
                        NormalButton(
                            title:LocalKeys.Button.getStarted.rawValue,
                            onTap: {onboardViewModel.saveUserLoginAndRedirect()})
                    }
                    
                }
            }
        }
    }
}

private struct PageIndicatorView: View {
    
    @Binding var currentIndex: Int
    let pageCount: Int
    
    var body: some View {
        HStack {
            ForEach(0..<pageCount, id: \.self) { index in
                IndicatorRectangle(width: index == currentIndex ? 20 : 6)
            }
        }
        .frame(height: ViewHeight.indicator)
    }
}

private struct SliderCard: View {
    let model: OnboardModel
    var imageHeight: Double
    var body: some View {
        VStack {
            Image(model.imageName)
                .frame(height: imageHeight)
            Text(model.description)
                .font(.system(size: FontSizes.largeTitle, weight: .semibold))
                .foregroundColor(.peach)
                .multilineTextAlignment(.center)
        }
    }
}

private struct IndicatorRectangle: View {
    var width: Double
    var body: some View {
        Rectangle()
            .fill(Color.clooney)
            .cornerRadius(RadiusItems.radius).frame(width: width)
        
    }
}

struct OnboardView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardView()
    }
}

