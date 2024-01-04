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
    
    @StateObject var viewModel = CVViewModel()
    
    init(viewModel: CVViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        
        ZStack {
            background
            
            ScrollView {
                VStack {
                    LazyVGrid(columns:columns, spacing:10) {
                        VStack(spacing:10) {
                            ForEach(viewModel.showCVObject, id:\.self){ cvData in
                                ForEach(cvData.programmingSkill, id: \.skillID) { mySkill in
                                    HStack {
                                        Text("\(mySkill.skillValue)")
                                            .typographyStyle(.detail_subheadline)
                                            .padding(.horizontal,10)
                                        
                                        if let skillPoints = Double(mySkill.skillPoints) {
                                            ProgressView(value: skillPoints, total: 5)
                                                .progressViewStyle(CustomProgressViewStyle(color: Theme.cvTheme))
                                                .frame(maxWidth:.infinity )
                                                        .padding(.horizontal, 5)
                                                    Text(String(format: "%.0f%%", skillPoints * 20))
                                                        .foregroundColor(.primary)
                                                        .typographyStyle(.detail_body)
                                        }
                                    }
                                }
                            }
                        }
                        .padding(.all)
                        //.background(Color.yellow)
                        .clipShape(RoundedRectangle(cornerRadius: 16,style: .continuous))
                    }
                }
                .navigationTitle("Programming Skills")
                .padding(.all)
            }
        }
    }
}


#Preview {
    SkillsVC(viewModel: CVViewModel())
}

private extension SkillsVC {
    var background: some View {
        Theme.whiteColor
            .ignoresSafeArea(edges: .all)
    }
}

