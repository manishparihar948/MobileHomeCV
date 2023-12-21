//
//  HomeVC.swift
//  MobileCV
//
//  Created by Manish Parihar on 13.07.23.
//

import SwiftUI

struct HomeVC: View {
    
    @StateObject var viewModel = CVViewModel()
    
    /*
    init(){
        
        let coloredAppearance = UINavigationBarAppearance()
         coloredAppearance.configureWithOpaqueBackground()
        coloredAppearance.backgroundColor = UIColor(Theme.cvTheme)
         coloredAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
         coloredAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
         UINavigationBar.appearance().standardAppearance = coloredAppearance
         UINavigationBar.appearance().compactAppearance = coloredAppearance
         UINavigationBar.appearance().scrollEdgeAppearance = coloredAppearance
         
         
         UINavigationBar.appearance().tintColor = .white
    }
     */
   
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
        
        NavigationView {
            
            ScrollView {
                
                VStack {
                    
                    ForEach(viewModel.showCVObject, id: \.self) {cvData in
                        
                        VStack {
                            Image("cv")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 200,height: 200)
                                .clipShape(Circle())
                                .background(Color.white)
                                .overlay(
                                        Circle()
                                            .stroke(Color.green, lineWidth: 5)
                                )
                                
                          
                            Text(cvData.displayName)
                                    .font(.system(size: 30, weight: .bold, design: .monospaced))
                                    .padding(.top,5)
                                
                            Text(cvData.designation)
                                .padding(.bottom,5)
                        }
                        
                        HStack {
                            VStack(alignment: .leading) {
                                
                                HStack {
                                    // General Information
                                    Symbols.calenderIcon
                                        .foregroundStyle(Theme.cvTheme)
                                        .padding(.trailing, 2)
                                    Text("\(cvData.dateOfBirth)")
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
                                        .padding(.bottom,5)
                                }
                                .padding(.leading,0)
 
                            }
                            .padding(.leading,0)
                            
                            VStack (alignment: .leading){
                                
                                HStack()
                                {
                                    Symbols.phoneIcon
                                        .foregroundStyle(Theme.cvTheme)
                                        .padding(.trailing, 2)
                                    
                                    Text("\(cvData.phoneNumber)")
                                        .padding(.bottom,5)
                                }
                                .padding(.leading,0)
                                                                
                                Spacer()
                                HStack()
                                {
                                    Symbols.emailIcon
                                        .foregroundStyle(Theme.cvTheme)
                                        .padding(.trailing, 2)
                                    
                                    Text("\(cvData.email)")
                                        .lineLimit(1)
                                        .padding(.bottom,5)
                                    
                                }
                                .padding(.leading,0)
                                
                            }                            
                            .padding(.leading,0)
                        }
                        .padding(.all)
                    }
                    
                    /*
                    NavigationLink(destination: ExperienceVC(viewModel:viewModel)) {
                        
                                    Text("Work Experience")
                                        .font(.headline)
                                        .padding()
                                        .background(Theme.cvTheme)
                                        .foregroundColor(.white)
                                        .cornerRadius(10)
                    }
                    
                    NavigationLink(destination: ExperienceVC(viewModel:viewModel)) {
                        
                                    Text("Education")
                                        .font(.headline)
                                        .padding()
                                        .background(Theme.cvTheme)
                                        .foregroundColor(.white)
                                        .cornerRadius(10)
                    }
                    
                    NavigationLink(destination: ExperienceVC(viewModel:viewModel)) {
                        
                                    Text("Skills")
                                        .font(.headline)
                                        .padding()
                                        .background(Theme.cvTheme)
                                        .foregroundColor(.white)
                                        .cornerRadius(10)
                    }
                    
                    NavigationLink(destination: ExperienceVC(viewModel:viewModel)) {
                        
                                    Text("Interest & Achievements")
                                        .font(.headline)
                                        .padding()
                                        .background(Theme.cvTheme)
                                        .foregroundColor(.white)
                                        .cornerRadius(10)
                    }
                     */
                }
                //.navigationTitle("CV")
                .onAppear{
                    viewModel.fetchCVDataFromAPI()
                }
            }
        }
    }
}
        
