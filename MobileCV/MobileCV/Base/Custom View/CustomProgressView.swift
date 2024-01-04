//
//  SegmentBar.swift
//  MobileCV
//
//  Created by Manish Parihar on 01.01.24.
//

import SwiftUI

// Add this LinearProgressViewStyle structure to your code
struct CustomProgressViewStyle: ProgressViewStyle {
    var color: Color

    func makeBody(configuration: Configuration) -> some View {
        ProgressView(configuration)
            .frame(height: 10) // Adjust height as needed
            //.foregroundColor(color) // Set the color
            .tint(color)
            .cornerRadius(5) // Optionally round the corners
            .padding()
    }
}


struct CustomProgressView: View {
    
    @Binding var progressValue: Double
    //var label: String

    var body: some View {
        HStack {
            //Text(label)
            ProgressView(value: progressValue.clamp01())
                .animation(.linear(duration: 2.0), value: 0.5)
                .padding()
            
        }
    }
}

// Extension to clamp a Double value to the range [0, 1]
extension Double {
    func clamp01() -> Double {
        return min(1.0, max(0.0, self))
    }
}
