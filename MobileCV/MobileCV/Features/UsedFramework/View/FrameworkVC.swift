//
//  FrameworkVC.swift
//  MobileCV
//
//  Created by Manish Parihar on 02.01.24.
//

import SwiftUI

struct FrameworkVC: View {
    
    private let columns = Array(repeating: GridItem(.flexible()), count: 2)
    
    var frameworkArray : Array = ["SwiftUI","React-Native","Flutter","Google Firebase","flame-link","Amplitue","Crashlytics", "Fastlane", "CircleCI", "Figma", "Pandas","Numpy", "Keras", "Tensor Flow", "Sci-kit learn", "Matplotlib", "Seaborn", "Selenium", "Django", "Vuejs"]
    
    var body: some View {
        LazyVGrid(columns:columns,spacing:5){
            ForEach(frameworkArray, id:\.self){ usedFramework in
                Text(usedFramework)
                    .typographyStyle(.subheadline)
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color.blue)
                    )
                    .foregroundColor(.white)
            }
        }
    }
}

#Preview {
    FrameworkVC()
}
