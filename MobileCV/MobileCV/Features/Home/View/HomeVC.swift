//
//  HomeVC.swift
//  MobileCV
//
//  Created by Manish Parihar on 13.07.23.
//

import SwiftUI

struct ButtonModel: Identifiable {
    let id = UUID()
    let tag: Int
    let title: String
}

struct HomeVC: View {
    private let columns = Array(repeating: GridItem(.flexible()), count: 2)
    private let horizontalColumns = Array(repeating: GridItem(.flexible()), count: 1)
    
    private let buttonAspectRatio: CGFloat = 0.5
    @State private var selectedButtonTag: Int?
    let buttonArray : [ButtonModel] = [
        ButtonModel(tag: 1, title:"Work Experience"),
        ButtonModel(tag: 2, title:"Education"),
        ButtonModel(tag: 3, title:"Programming Skills"),
        ButtonModel(tag: 4, title:"Project Skills"),
        ButtonModel(tag: 5, title:"Frameworks"),
        ButtonModel(tag: 6, title:"Tools"),
        ButtonModel(tag: 7, title:"Achievements & Interest")
    ]
    
    @StateObject var viewModel = CVViewModel()
        
    var body: some View {
        ZStack {
            background
            
            foreground
        }
    }
}

struct HomeVC_Previews: PreviewProvider {
    static var previews: some View {
        HomeVC()
    }
}

private extension HomeVC {
        
    var background: some View {
        Theme.background
            .ignoresSafeArea(edges: .all)
    }
    
    var foreground:some View {
        NavigationStack {
            ScrollView {
                VStack {
                    ForEach(viewModel.showCVObject, id: \.self) { cvData in
                        VStack(alignment:.leading, spacing:0) {
                            // Top View
                            HStack {
                                Image("cv")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 100,height: 100)
                                    .clipShape(Circle())
                                    .overlay(
                                        Circle()
                                            .stroke(Theme.cvTheme, lineWidth: 5)
                                    )
                                    .padding(.leading,10)
                                    .padding(.trailing,10)
                                
                                VStack {
                                    Text("\(cvData.displayName)")
                                        .typographyStyle(.headline)
                                        .padding(.top,5)
                                    
                                    HStack {
                                        Text("\(cvData.designation)")
                                            .typographyStyle(.subheadline)
                                            .padding(.bottom,5)
                                            .padding(.trailing,5)
                                    }
                                }
                            }
                            
                            // Middle View
                            HStack {
                                Spacer()
                                VStack(alignment: .leading) {
                                    HStack {
                                        Symbols.calenderIcon
                                            .foregroundStyle(Theme.cvTheme)
                                            .padding(.trailing, 2)
                                        Text("\(cvData.dateOfBirth)")
                                            .typographyStyle(.body)
                                            .padding(.bottom,5)
                                    }
                                    .padding(.leading,0)
                                    
                                    Spacer()
                                    
                                    HStack()
                                    {
                                        Symbols.homeIcon
                                            .foregroundStyle(Theme.cvTheme)
                                            .padding(.trailing, 2)
                                        
                                        Text("\(cvData.place)")
                                            .typographyStyle(.body)
                                            .padding(.bottom,5)
                                    }
                                    .padding(.leading,0)
                                }
                                .padding(.leading,20)
                                Spacer()
                                VStack (alignment: .center){
                                    
                                    HStack(alignment:.center)
                                    {
                                        Symbols.phoneIcon
                                            .foregroundStyle(Theme.cvTheme)
                                            .padding(.trailing, 2)
                                        
                                        Text("\(cvData.phoneNumber)")
                                            .typographyStyle(.body)
                                            .padding(.bottom,5)
                                    }
                                    .padding(.leading,0)
                                    
                                    Spacer()
                                    
                                    HStack(alignment:.center)
                                    {
                                        Symbols.emailIcon
                                            .foregroundStyle(Theme.cvTheme)
                                            .padding(.trailing, 2)
                                        
                                        Text("\(cvData.email)")
                                            .typographyStyle(.body)
                                            .padding(.bottom,5)
                                        
                                    }
                                    .padding(.leading,0)
                                    
                                }
                                .padding(.trailing,10)
                                Spacer()
                            }
                            .padding()
                            
                            // Social Network
                            HStack {
                                ForEach(cvData.socialNetwork, id: \.socialID) { title in
                                    
                                    
                                    Button(action: {
                                        // Action for each button
                                        print("Button tapped: \(title.socialName)")
                                        if let url = URL(string: title.socialValue), UIApplication.shared.canOpenURL(url) {
                                            UIApplication.shared.open(url, options: [:], completionHandler: nil)
                                        }
                                    }) {
                                        Text("\(title.socialName)")
                                            .typographyStyle(.detail_subheadline)
                                            .foregroundStyle(.white)
                                            .cornerRadius(8)
                                    }
                                    .padding(5)
                                    .background(Theme.cvTheme)
                                    .cornerRadius(5)
                                     
                                    

                                }
                            }
                            .padding()
                            
                            Divider()
                            
                            // Description View
                            HStack(alignment: .top) {
                                Spacer()
                                Text("\(cvData.intro)")
                                    .typographyStyle(.subheadline)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                            }
                            .padding()
                            
                            // Bottom View
                            LazyVGrid(columns: columns, spacing:15) {
                                ForEach(buttonArray) { button in
                                    NavigationLink(
                                        destination: destinationView(for: button),
                                        isActive: Binding(
                                            get: { selectedButtonTag == button.tag },
                                            set: { isActive in
                                                if isActive {
                                                    selectedButtonTag = button.tag
                                                }
                                            }
                                        )
                                    ) {
                                        Button(action: {
                                            selectedButtonTag = button.tag
                                        }) {
                                            Text(button.title)
                                                .padding()
                                                .frame(width: UIScreen.main.bounds.width / 2 - 30, height: UIScreen.main.bounds.width / 2  * buttonAspectRatio)
                                                .background(selectedButtonTag == button.tag ? Theme.cvTheme : Color.gray)
                                                .foregroundColor(.white)
                                                .cornerRadius(8)
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
                .navigationTitle("Resume")
                .onAppear{
                    Task {
                        await viewModel.fetchCVDataFromAPI()
                    }
                }
            }
        }
    }
    
    func destinationView(for button: ButtonModel) -> some View {
        switch button.tag {
        case 1:
            return AnyView(DetailVC(viewModel: viewModel))
        case 2:
            return AnyView(EducationVC(viewModel: viewModel))
        case 3:
            return AnyView(SkillsVC(viewModel: viewModel))
        case 4:
            return AnyView(ProjectSkillVC()) // AnyView(ProjectSkillVC())
        case 5:
            return AnyView(FrameworkVC(viewModel: viewModel))
        case 6:
            return AnyView(ToolsVC())
        case 7:
            return AnyView(AchievementVC(viewModel: viewModel))
        default:
            return AnyView(EmptyView())
        }
    }
}

