//
//  GridButton.swift
//  MobileCV
//
//  Created by Manish Parihar on 21.12.23.
//

import SwiftUI

struct GridButton: View {
    var buttonText: String
    var buttonImage: String
    var action: () -> Void

    var body: some View {
        Button(action: action){
            VStack(spacing:.zero) {
                VStack {
                    Image(systemName: buttonImage)
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 30, height: 30)
                                        .foregroundColor(Theme.cvTheme)
                    
                    Text(buttonText)
                            .foregroundColor(Theme.cvTheme)
                            .typographyStyle(.subheadline)
                }
                .frame(width:120, height:120, alignment: .leading)
                .background(Theme.whiteColor)
            }
            .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
            .shadow(color: Theme.text.opacity(0.1), radius: 2, x: 0, y: 1)
        }
        .background(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Theme.cvTheme, lineWidth: 4)
                )

    }
}
