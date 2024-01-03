//
//  ProjectSkillVC.swift
//  MobileCV
//
//  Created by Manish Parihar on 03.01.24.
//

import SwiftUI

struct ProjectSkillVC: View {
    
    private let columns = Array(repeating: GridItem(.flexible()), count: 2)
    
    var toolArray : Array = ["jira","msteam","latex","slack","scrum","notion","msoffice"]


    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: columns, spacing:15) {
                    ForEach(toolArray, id:\.self){ myTool in
                        Image(myTool)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 120, height: 120)
                            .shadow(color: Theme.aluminiumColor, radius: 8, x: 0, y: 5)
                    }
                }
                .navigationTitle("Project Skills")
            }
        }
    }
}

#Preview {
    ProjectSkillVC()
}
