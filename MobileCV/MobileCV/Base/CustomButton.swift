//
//  CustomButton.swift
//  MobileCV
//
//  Created by Manish Parihar on 05.01.24.
//

import SwiftUI

struct CustomButton: View {
    //let systemImage: String
    let title: String
    let url: String

    var body: some View {
        
        /*
        Button(action: {
            openURL()
        }) {
               // Image(systemName: systemImage)
               //     .foregroundStyle(Theme.whiteColor)
               //     .font(.title)
                
                Text(buttonText)
                    .typographyStyle(.detail_subheadline)
                    .foregroundStyle(.white)
            }
            .padding(5)
            .background(Theme.cvTheme)
            .cornerRadius(5)
         */
        
        Button(action: {
            // Action for each button
            openURL()

        }) {
            Text(title)
                .padding()
                .foregroundColor(.white)
                .background(Color.blue)
                .cornerRadius(8)
        }
        
    }

    func openURL() {
        if let url = URL(string: url), UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
}
