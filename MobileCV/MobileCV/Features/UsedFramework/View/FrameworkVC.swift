//
//  FrameworkVC.swift
//  MobileCV
//
//  Created by Manish Parihar on 02.01.24.
//

import SwiftUI

struct FrameworkVC: View {
    
    private let columns = Array(repeating: GridItem(.flexible()), count: 3)
    private let buttonAspectRatio: CGFloat = 0.5

    var frameworkArray : Array = ["SwiftUI","React-Native","Flutter","Google Firebase","Flame-link","Amplitue","Crashlytics", "Fastlane", "CircleCI", "Figma", "Pandas","Numpy", "Keras", "Tensor Flow", "Matplotlib", "Seaborn", "Selenium", "Django", "Vuejs", "Sci-kit learn"]
    
    var body: some View {
        
        ScrollView {
            LazyVGrid(columns:columns,spacing:10){
                ForEach(frameworkArray, id:\.self){ usedFramework in
                    Text(usedFramework)
                        .typographyStyle(.subheadline)
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color.blue)
                        )
                        .foregroundColor(.white)
                        .frame(width: UIScreen.main.bounds.width / 2 - 30, height: UIScreen.main.bounds.width / 2 * buttonAspectRatio)
                }
            }.navigationTitle("Frameworks")
        }
    }
}

#Preview {
    FrameworkVC()
}
