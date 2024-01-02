//
//  AchievementVC.swift
//  MobileCV
//
//  Created by Manish Parihar on 02.01.24.
//

import SwiftUI

struct AchievementVC: View {
    
    var body: some View {
        NavigationStack {
            List {
                Section(header: Text("Achievenemts")) {
                    VStack(alignment:.leading, spacing: 10) {
                        HStack {
                            Image(systemName: "trophy")
                            Text("President Award")
                                .typographyStyle(.subheadline)
                            Spacer()
                            Text("2003")
                                .typographyStyle(.detail_body)
                                .foregroundStyle(Theme.aluminiumColor)
                        }
                        Text("Awarded by the President of India, Dr.A.P.J Abdul Kalam Sir in India Scouts")
                            .typographyStyle(.detail_subheadline)
                            .foregroundStyle(Theme.silverBG)

                        
                           
                    }
                }
                Section(header:Text("Interest")){
                    VStack(alignment:.leading, spacing: 10) {
                        Text("Playing Ukulele")
                        Text("Cycling")
                        Text("Urban Farming")
                    }
                    .typographyStyle(.subheadline)
                }
            }
        }
    }
}

#Preview {
    AchievementVC()
}
