//
//  ExperienceVC.swift
//  MobileCV
//
//  Created by Manish Parihar on 13.07.23.
//

import SwiftUI

struct ExperienceVC: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    @StateObject var viewModel = CVViewModel()
    
    var body: some View {
       
        VStack {
            List {
                ExperienceRow(viewModel: viewModel)
            }
        }
        .customNavigationView(backgroundColor: Theme.cvTheme)
        .navigationTitle("Work Experience")
        .navigationBarBackButtonHidden(true)
               .navigationBarItems(leading: backButton)
        
    }
    
    private var backButton: some View {
            Button(action: {
                presentationMode.wrappedValue.dismiss()
            }) {
                Image(systemName: "arrow.backward")
                    .font(.subheadline)
                    .foregroundColor(.white)
            }
        }
}

struct ExperienceVC_Previews: PreviewProvider {
    static var previews: some View {
        ExperienceVC()
    }
}

struct ExperienceRow: View {
    
    @StateObject var viewModel = CVViewModel()
    
    var body: some View {
        ForEach(viewModel.showCVObject, id: \.self) { cvData in
            
            ForEach(cvData.workExperience, id: \.workID) { work in
                VStack(alignment:.leading) {
                    
                    Text(work.workCompany)
                            .font(.headline)
                            .padding(.bottom,5)
                    
                    HStack {
                        Text(work.workPlace)
                            .padding(.leading,10)
                            .font(.body)
                            .foregroundColor(Color.gray)
                    
                        Text(work.workCountry)
                        .padding(.leading,10)
                        .font(.body)
                        .foregroundColor(Color.gray)
                    }.padding(.leading,5)
                        .padding(.bottom,5)

                    
                    
                    HStack {
                        Text(work.workStartDate)
                            .font(.body)
                            .foregroundColor(Color.gray)

                        Text("-")
                            .font(.body)
                            .foregroundColor(Color.gray)

                        Text(work.workEndDate)
                            .font(.body)
                            .foregroundColor(Color.gray)

                    }.padding(.leading,5)
                }
            }
        }
    }
}
