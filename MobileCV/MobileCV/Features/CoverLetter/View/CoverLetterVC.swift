//
//  CoverLetterVC.swift
//  MobileCV
//
//  Created by Manish Parihar on 08.01.24.
//

import SwiftUI

struct CoverLetterVC: View {
    
    @AppStorage("isOnboarding") var isOnboarding: Bool?

    var body: some View {
        ScrollView {
            VStack {
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundColor(.accentColor)
                Text("Hello, my world!")
            }
        }
    }
}

#Preview {
    CoverLetterVC()
}
