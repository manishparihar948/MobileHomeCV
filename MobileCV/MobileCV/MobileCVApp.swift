//
//  MobileCVApp.swift
//  MobileCV
//
//  Created by Manish Parihar on 10.07.23.
//

import SwiftUI

@main
struct MobileCVApp: App {
    @AppStorage("isOnboarding") var isOnboarding: Bool = true
    
    var body: some Scene {
        WindowGroup {
            if isOnboarding {
                OnBoardingView()
            } else {
                HomeVC()
                //CoverLetterVC()
            }
           
        }
    }
}
