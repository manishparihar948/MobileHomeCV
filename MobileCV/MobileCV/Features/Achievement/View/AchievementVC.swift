//
//  AchievementVC.swift
//  MobileCV
//
//  Created by Manish Parihar on 02.01.24.
//

import SwiftUI

struct AchievementVC: View {
    
    @StateObject var viewModel = CVViewModel()

    init(viewModel: CVViewModel) {
           _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        ZStack {
            background
            frontend
        }
    }
}

#Preview {
    AchievementVC(viewModel: CVViewModel())
}

private extension AchievementVC {
    var background: some View {
        Theme.background
            .ignoresSafeArea(edges: .all)
    }
    
    var frontend: some View {
        VStack(alignment: .leading, spacing: 10) {
            List {
                ForEach(viewModel.showCVObject, id:\.self){ cvData in
                    Section(header: Text("Achievements").font(.headline).foregroundColor(.primary)) {
                        ForEach(cvData.achievements, id: \.achievementsID) { myAchievements in
                            VStack(alignment:.leading, spacing:5) {
                                HStack {
                                    Image(systemName: "trophy")
                                        .foregroundStyle(Theme.cvTheme)
                                    Text("\(myAchievements.achievementsName)")
                                        .typographyStyle(.subheadline)
                                    Spacer()
                                    Text("\(myAchievements.achievementsYear)")
                                        .typographyStyle(.detail_body)
                                        .foregroundStyle(Theme.aluminiumColor)
                                }
                                Text("\(myAchievements.achievementsDesc)")
                                    .typographyStyle(.detail_subheadline)
                                    .foregroundStyle(Theme.silverBG)
                            }
                        }
                    }
                    
                    Section(header: Text("Interests").font(.headline).foregroundColor(.primary)) {
                        ForEach(cvData.interests, id: \.interestsID) { myInterest in
                            VStack(alignment:.leading, spacing:5) {
                                Text("\(myInterest.interestsName)")
                                    .typographyStyle(.detail_headline)
                                    .foregroundStyle(Theme.silverBG)
                                
                            }
                        }
                    }
                }

            }
        }
    }
}
