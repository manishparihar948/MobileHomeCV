//
//  OnBoardingView.swift
//  MobileCV
//
//  Created by Manish Parihar on 08.01.24.
//

import SwiftUI

struct OnBoardingView: View {
    
    var onboardingContents: [OnBoarding] = onBoardingsData
    
    var body: some View {
        TabView {
          ForEach(onboardingContents[0...5]) { item in
              OnBoardingCardView(onboarding: item)
          } //: LOOP
        } //: TAB
        .tabViewStyle(PageTabViewStyle())
        .padding(.vertical, 20)
    }
}

#Preview {
    OnBoardingView()
}
