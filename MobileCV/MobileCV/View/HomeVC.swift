//
//  HomeVC.swift
//  MobileCV
//
//  Created by Manish Parihar on 13.07.23.
//

import SwiftUI

struct HomeVC: View {
    
    @StateObject var viewModel = CVViewModel()
    
        
    init(){
        let coloredAppearance = UINavigationBarAppearance()
         coloredAppearance.configureWithOpaqueBackground()
        coloredAppearance.backgroundColor = .systemBlue
         coloredAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
         coloredAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
         
         UINavigationBar.appearance().standardAppearance = coloredAppearance
         UINavigationBar.appearance().compactAppearance = coloredAppearance
         UINavigationBar.appearance().scrollEdgeAppearance = coloredAppearance
         
         UINavigationBar.appearance().tintColor = .white
    }
   
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    ForEach(viewModel.showCVObject, id: \.self) {cvData in
                        
                        Image("mp")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 200,height: 200)
                            .clipShape(Circle())
                            .background(Color.clear)
                            
                      
                        Text(cvData.displayName)
                                .font(.system(size: 30, weight: .bold, design: .monospaced))
                                .padding(.top,5)
                            
                        Text(cvData.designation)
                            .padding(.bottom,5)
                        
                        // General Information
                        Text("Date Of Birth: \(cvData.dateOfBirth)")
                            .padding(.bottom,5)

                        Text("Place: \(cvData.place)")
                            .padding(.bottom,5)

                        Text("Phone Number: \(cvData.phoneNumber)")
                            .padding(.bottom,5)

                        Text("Email: \(cvData.email)")
                            .padding(.bottom,5)
                    }
                    
                    NavigationLink(destination: ExperienceVC(viewModel:viewModel)) {
                        
                                    Text("Work Experience")
                                        .font(.headline)
                                        .padding()
                                        .background(Color.blue)
                                        .foregroundColor(.white)
                                        .cornerRadius(10)
                    }
                    
                    NavigationLink(destination: ExperienceVC(viewModel:viewModel)) {
                        
                                    Text("Education")
                                        .font(.headline)
                                        .padding()
                                        .background(Color.blue)
                                        .foregroundColor(.white)
                                        .cornerRadius(10)
                    }
                    
                    NavigationLink(destination: ExperienceVC(viewModel:viewModel)) {
                        
                                    Text("Skills")
                                        .font(.headline)
                                        .padding()
                                        .background(Color.blue)
                                        .foregroundColor(.white)
                                        .cornerRadius(10)
                    }
                    
                    NavigationLink(destination: ExperienceVC(viewModel:viewModel)) {
                        
                                    Text("Interest & Achievements")
                                        .font(.headline)
                                        .padding()
                                        .background(Color.blue)
                                        .foregroundColor(.white)
                                        .cornerRadius(10)
                    }
                }
                .navigationTitle("CV")
                .onAppear{
                    viewModel.fetchCVDataFromAPI()
                }
            }
        }
    }
}


struct HomeVC_Previews: PreviewProvider {
    static var previews: some View {
        HomeVC()
    }
}


        
