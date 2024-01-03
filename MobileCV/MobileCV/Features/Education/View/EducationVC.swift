//
//  EducationVC.swift
//  MobileCV
//
//  Created by Manish Parihar on 22.12.23.
//

import SwiftUI

struct EducationVC: View {
    var educationArray : Array = ["Berlin University of Applied Science","Rajiv Gandhi Technical University"]

    var body: some View {
        ZStack {
            background
            
            VStack {
                List {
                    ForEach(educationArray,id:\.self) { myEducation in
                        Text(myEducation)
                    }
                }
            }
        }
    }
   
}

#Preview {
    EducationVC()
}

private extension EducationVC {
    var background: some View {
        Theme.background
            .ignoresSafeArea(edges: .all)
    }
}
