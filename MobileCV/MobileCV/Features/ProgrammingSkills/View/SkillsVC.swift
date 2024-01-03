//
//  SkillsVC.swift
//  MobileCV
//
//  Created by Manish Parihar on 01.01.24.
//

import SwiftUI

struct SkillsVC: View {
    @State private var progressValue: Double = 3.0
    private let columns = Array(repeating: GridItem(.flexible()), count: 1)

    var body: some View {
        
        ZStack {
            background
            
            VStack {
                LazyVGrid(columns:columns) {
                    VStack(spacing:.zero) {
                        HStack {
                             Text("SwiftUI")
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding(.horizontal,5)
                            
                             //ProgressView(value: progressValue, total: 5)
                            CustomProgressView(progressValue: $progressValue, label: "SwiftUI")
                                .padding(.horizontal,5)
                            
                            Text("\(Int(progressValue))")
                        }
                        .frame(maxWidth: .infinity, alignment: .center)
                        
                       
                    }
                    .padding(.all)
                    .background(Color.yellow)
                    .clipShape(RoundedRectangle(cornerRadius: 16,style: .continuous))
                }
            }
            .padding(.all)
        }
    }
}

#Preview {
    SkillsVC()
}


private extension SkillsVC {
    var background: some View {
        Theme.background
            .ignoresSafeArea(edges: .all)
    }
}
