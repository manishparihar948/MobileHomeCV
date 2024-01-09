//
//  OnBoardingData.swift
//  MobileCV
//
//  Created by Manish Parihar on 08.01.24.
//

import Foundation
import SwiftUI

// MARK: - FRUITS DATA

let onBoardingsData: [OnBoarding] = [
    OnBoarding(
      title: "Introduction",
      headline: "Welcome to my cv app",
      image: "profile",
      gradientColors: [Color("ColorBlueberryLight"), Color("ColorBlueberryDark")]
    ),
    OnBoarding(
      title: "View",
      headline: "View my profile in mobile app format in list or menu form",
      image: "work",
      gradientColors: [Color("ColorStrawberryLight"), Color("ColorStrawberryDark")]
    ),
    OnBoarding(
     title: "Education",
     headline: "Get my education details",
     image: "education",
     gradientColors: [Color("ColorLimeLight"), Color("ColorLimeDark")]
   ),
    OnBoarding(
      title: "Experience",
      headline: "There is my roles & responsibilites mentioned according to company wise",
      image: "work",
      gradientColors: [Color("ColorLemonLight"), Color("ColorLemonDark")]
    ),
    OnBoarding(
      title: "Frameworks",
      headline: "The frameworks i have used till now",
      image: "framework",
      gradientColors: [Color("ColorPlumLight"), Color("ColorPlumDark")]
    ),
    OnBoarding(
      title: "Achievements & Interest",
      headline: "Recognition i received during my career",
      image: "achievement",
      gradientColors: [Color("ColorPomegranateLight"), Color("ColorPomegranateDark")]
    )
]
