//
//  DetailVC.swift
//  MobileCV
//
//  Created by Manish Parihar on 27.12.23.
//

import SwiftUI

struct DetailVC: View {
    private let columns = Array(repeating: GridItem(.flexible()), count: 1)
    
    @StateObject var viewModel = CVViewModel()

    init(viewModel: CVViewModel) {
           _viewModel = StateObject(wrappedValue: viewModel)
       }
    
    var body: some View {
           ZStack {
               background

               ScrollView {
                   LazyVGrid(columns: columns, spacing: 10) {
                       ForEach(viewModel.showCVObject, id:\.self){ cvData in
                           ForEach(cvData.workExperience, id: \.workID) { workExperience in
                               NavigationLink {
                                   CompanysDetailVC(workExperience: workExperience)
                               } label : {
                                   CompanyItemView(workExperience: workExperience)
                               }
                           }
                       }
                   }
                   .padding()
                   .navigationTitle("Company")
               }
           }
       }
}


struct CompanyItemView_Previews: PreviewProvider {
    static var previews: some View {
        CompanyItemView(workExperience: sampleWorkExperience)
            .previewLayout(.sizeThatFits)
            .padding()
            .background(Color.gray) // Optional: Add a background color for better visibility
    }

    static let sampleWorkExperience = WorkExperience(
        workID: "C01",
        workCompany: "Your Company Name", // Replace with your actual company name
        workPlace: "Berlin",
        workCountry: "Germany",
        workDesignation: "Lead IOS Consultant",
        workCompanyLogo: "",
        workStartDate: "Dec 2022",
        workEndDate: "Present",
        workDescription: [
            WorkDescription(workDescID: "desc01", workDescStmt: ["Statement 1", "Statement 2"])
        ]
    )
}


private extension DetailVC {
    var background: some View {
        Theme.background
            .ignoresSafeArea(.all)
    }
}

struct CompanyItemView : View {
    let workExperience : WorkExperience
    
    var body: some View {
        VStack(spacing: .zero) {
            VStack(alignment:.leading) {
                HStack(alignment:.top) {
                    Image(systemName: "building.columns")
                        .foregroundStyle(.white)
                    
                    Text("\(workExperience.workCompany)")
                        .typographyStyle(.detail_headline)
                        .foregroundStyle(.white)
                }
                
                Text("\(workExperience.workDesignation)")
                    .typographyStyle(.detail_subheadline)
                    .foregroundStyle(.white)

                Text("Duration: \(workExperience.workStartDate) - \(workExperience.workEndDate)")
                    .typographyStyle(.body)
                    .foregroundStyle(.white)
                
                Text("Company Location:\(workExperience.workPlace),\(workExperience.workCountry)")
                        .typographyStyle(.detail_body)
                        .foregroundStyle(.white)
            }
            .frame(maxWidth:.infinity, alignment:.leading)
            .padding(.all)
            .background(
             LinearGradient(gradient: Gradient(colors: [Color.blue, Theme.cvTheme]), startPoint: .top, endPoint: .bottom)
                    .clipShape(RoundedRectangle(cornerRadius: 15, style: .continuous))
                    .shadow(color:Theme.text.opacity(0.2), radius:2, x:0, y:1)
            )
        }
        .clipShape(RoundedRectangle(cornerRadius: 15, style: .continuous))
        .shadow(color:Theme.text.opacity(0.2), radius:2, x:0, y:1)
    }
}


