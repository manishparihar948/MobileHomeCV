//
//  ToolsVC.swift
//  MobileCV
//
//  Created by Manish Parihar on 02.01.24.
//

import SwiftUI

struct ToolsVC: View {
    
    private let columns = Array(repeating: GridItem(.flexible()), count: 2)
    
    var toolArray : Array = ["xcode","android","anaconda","Figma","git","jupyter","miro", "mspowerapps", "postman", "vs"]


    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: columns, spacing:15) {
                    ForEach(toolArray, id:\.self){ myTool in
                        Image(myTool)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 120, height: 120)
                            .shadow(color: Theme.cvTheme, radius: 8, x: 0, y: 5)
                    }
                }
                .navigationTitle("Tools Use")
            }
        }
    }
}

#Preview {
    ToolsVC()
}
