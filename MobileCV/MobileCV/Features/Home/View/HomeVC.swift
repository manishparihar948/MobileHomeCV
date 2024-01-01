//
//  HomeVC.swift
//  MobileCV
//
//  Created by Manish Parihar on 13.07.23.
//

import SwiftUI

struct HomeVC: View {
    private let columns = Array(repeating: GridItem(.flexible()),
                                count: 2)
    var buttonArray : Array = ["1","2","3","4","5","6"]
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
                    ForEach(viewModel.showCVObject, id: \.self) {cvData in
                        VStack {
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
                                    .padding(.leading,5)
                                
                                VStack {
                                    Text(cvData.displayName)
                                        .typographyStyle(.headline)
                                        .padding(.top,5)
                                    
                                    Text(cvData.designation)
                                        .typographyStyle(.subheadline)
                                        .padding(.bottom,5)
                                }
                            }
                            
                            // Middle View
                            HStack(alignment:.center) {
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
                            
                            Divider()
                            
                            // Description View
                            HStack(alignment: .center) {
                                Spacer()
                                Text("\(cvData.intro)")
                                    .typographyStyle(.subheadline)
                            }
                            .padding()
                            
                            // Bottom View
                            /*
                            VStack(alignment:.center) {
                                
                                
                                HStack(alignment:.center) {
                                    Group {
                                        NavigationLink(destination: ExperienceVC()) {
                                            GridButton(buttonText: "Experience", buttonImage: "rectangle.inset.filled.and.person.filled") {
                                                print("Experience button tapped")
                                            }
                                        }
                                        
                                        GridButton(buttonText: "Education", buttonImage: "rectangle.inset.filled.and.person.filled"){
                                            print("Education butotn tapped")
                                        }
                                        
                                        GridButton(buttonText: "Skills", buttonImage: "rectangle.inset.filled.and.person.filled"){
                                            print("Skills butotn tapped")
                                        }
                                         
                                        
                                    }
                                }
                                .frame(alignment:.center)
                                
                                HStack(alignment:.center) {
                                    Group {
                                        GridButton(buttonText: "Interest", buttonImage: "rectangle.inset.filled.and.person.filled"){
                                            print("Interest butotn tapped")
                                        }
                                        GridButton(buttonText: "Achievements", buttonImage: "rectangle.inset.filled.and.person.filled"){
                                            print("Achievements butotn tapped")
                                        }
                                        GridButton(buttonText: "Project", buttonImage: "rectangle.inset.filled.and.person.filled"){
                                            print("Project butotn tapped")
                                        }
                                    }
                                }
                                .frame(alignment:.center)
                            }
                            */
                            LazyVGrid(columns: columns, spacing:15) {
                                ForEach(buttonArray, id:\.self){ myCVButton in
                                    NavigationLink {
                                        DetailVC()
                                    } label: {
                                        Text(myCVButton)
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
}

