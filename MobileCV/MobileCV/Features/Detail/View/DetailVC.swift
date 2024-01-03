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
                               VStack(spacing: .zero) {
                                   VStack(alignment:.leading) {
                                       
                                       HStack {
                                           Image(systemName: "building.columns")
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
                   }
                   .padding()
                   .navigationTitle("Company")
               }
           }
       }
}



struct DetailVC_Previews: PreviewProvider {
    
    static var previews: some View {
        DetailVC(viewModel: CVViewModel())
    }
}

private extension DetailVC {
    var background: some View {
        Theme.background
            .ignoresSafeArea(.all)
    }
}
