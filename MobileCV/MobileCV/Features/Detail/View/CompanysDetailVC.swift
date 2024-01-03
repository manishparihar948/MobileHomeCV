//
//  CompanysDetailVC.swift
//  MobileCV
//
//  Created by Manish Parihar on 03.01.24.
//

import SwiftUI

struct CompanysDetailVC: View {
    let workExperience: WorkExperience

    var body: some View {
        NavigationStack {
                VStack {
                    List {
                        ForEach(workExperience.workDescription, id: \.workDescID) { workDesc in
                            Section(header: Text("Work Description")) {
                                ForEach(workDesc.workDescStmt, id: \.self) { statement in
                                    Text("📱 \(statement)")
                                        .typographyStyle(.subheadline)
                                        .foregroundStyle(Color.black)
                                }
                            }
                        }
                    }
                    .listStyle(PlainListStyle())
                }.navigationTitle(workExperience.workCompany)
        }
    }
}

/*
 #Preview {
 CompanysDetailVC()
 }
 */

struct CompanysDetailVC_Previews: PreviewProvider {
    static var previews: some View {
        CompanysDetailVC(workExperience: sampleWorkExperience)
    }

    static let sampleWorkExperience = WorkExperience(
        workID: "C01",
        workCompany: "Autonomy OnBoard GmbH",
        workPlace: "Berlin",
        workCountry: "Germany",
        workDesignation: "Lead IOS Consultant",
        workCompanyLogo: "",
        workStartDate: "Dec 2022",
        workEndDate: "Present",
        workDescription: [
            WorkDescription(workDescID: "desc01", workDescStmt: ["Statement 1", "Statement 2"]),
            WorkDescription(workDescID: "desc02", workDescStmt: ["Statement A", "Statement B"])
        ]
    )
}



