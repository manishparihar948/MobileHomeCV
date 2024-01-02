//
//  SegmentBar.swift
//  MobileCV
//
//  Created by Manish Parihar on 01.01.24.
//

import SwiftUI

struct LinearProgressViewStyle: ProgressViewStyle {
    func makeBody(configuration: Configuration) -> some View {
        ProgressView(configuration)
            .frame(height: 10) // Adjust height as needed
            .foregroundColor(Theme.lightOrange) // Customize the color
            .cornerRadius(5) // Optionally round the corners
            .padding()
    }
}

struct CustomProgressView: View {
    @Binding var progressValue: Double
    var label: String

    var body: some View {
        HStack {
            Text(label)
            ProgressView(value: progressValue)
                .progressViewStyle(LinearProgressViewStyle()) // Customize the style if needed
                .animation(.linear(duration: 2.0), value: 0.5)
                .padding()
            
        }
    }
}
