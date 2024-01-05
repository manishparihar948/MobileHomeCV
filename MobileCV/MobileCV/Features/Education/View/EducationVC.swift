//
//  EducationVC.swift
//  MobileCV
//
//  Created by Manish Parihar on 22.12.23.
//

import SwiftUI

struct EducationVC: View {
    
    @StateObject var viewModel = CVViewModel()

    init(viewModel: CVViewModel) {
           _viewModel = StateObject(wrappedValue: viewModel)
    }


    var body: some View {
        ZStack {
            background
            
            VStack {
                List {
                    ForEach(viewModel.showCVObject, id:\.self){ cvData in
                        ForEach(cvData.educationBackground, id: \.degreeID) { myEducation in
                            VStack(alignment:.leading, spacing:5) {
                                Text("\(myEducation.degreeUniversityName)")
                                    .typographyStyle(.detail_headline)
                                    .foregroundStyle(Theme.silverBG)
                                Text("\(myEducation.degreeName) - \(myEducation.degreeCourse)")
                                    .typographyStyle(.detail_subheadline)
                                    .foregroundStyle(Theme.cvTheme)
                                Text("\(myEducation.degreeUniversityPlace), \(myEducation.degreeUniversityCountry)")
                                    .typographyStyle(.detail_body)
                                Text("\(myEducation.degreeStartYear)-\(myEducation.degreeEndYear)")
                                    .typographyStyle(.detail_body)
                            }
                        }
                    }
                }.navigationTitle("Education")
            }
        }
    }
   
}


#Preview {
    EducationVC(viewModel: CVViewModel())
}

private extension EducationVC {
    var background: some View {
        Theme.background
            .ignoresSafeArea(edges: .all)
    }
}
