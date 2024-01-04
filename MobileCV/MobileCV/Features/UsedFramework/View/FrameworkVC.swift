//
//  FrameworkVC.swift
//  MobileCV
//
//  Created by Manish Parihar on 02.01.24.
//


import SwiftUI

struct FrameworkVC: View {
    @StateObject var viewModel = CVViewModel()

    init(viewModel: CVViewModel) {
           _viewModel = StateObject(wrappedValue: viewModel)
    }

    private let columns = Array(repeating: GridItem(.flexible()), count: 3)
    private let buttonAspectRatio: CGFloat = 0.5
        
    var body: some View {
        
        ScrollView {
            LazyVGrid(columns:columns,spacing:10){
                ForEach(viewModel.showCVObject, id:\.self){ cvData in
                    ForEach(cvData.frameworks, id:\.frameworkID) { usedFramework in
                        Text("\(usedFramework.frameworkValue)")
                            .typographyStyle(.subheadline)
                            .padding()
                            .background(
                             //LinearGradient(gradient: Gradient(colors: [Color.blue, Theme.cvTheme]), startPoint: .top, endPoint: .bottom)
                                LinearGradient(gradient: Gradient(colors: [backgroundColor(for: usedFramework.frameworkSubject), Theme.cvTheme]), startPoint: .top, endPoint: .bottom)

                                    .clipShape(RoundedRectangle(cornerRadius: 15, style: .continuous))
                                    .shadow(color:Theme.text.opacity(0.2), radius:2, x:0, y:1)
                            )
                            .foregroundColor(.white)
                            .frame(width: UIScreen.main.bounds.width / 2 - 30, height: UIScreen.main.bounds.width / 2 * buttonAspectRatio)
                    }
                }
            }.navigationTitle("Frameworks")
        }
    }
}

#Preview {
    FrameworkVC(viewModel: CVViewModel())
}

// Color based on framework category
func backgroundColor(for frameworkSubject: String) -> Color {
        switch frameworkSubject {
        case "ml-ai":
            return Theme.darkGreen
        case "mobile":
            return Theme.eggPlant
        case "web-development":
            return Color.red
        default:
            return Color.gray
        }
    }

/*
// By Column wise
import SwiftUI

struct FrameworkVC: View {
    @StateObject var viewModel = CVViewModel()

    init(viewModel: CVViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    private let buttonAspectRatio: CGFloat = 0.5

    var body: some View {
        ScrollView {
            LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 10) {
                ForEach(viewModel.uniqueFrameworkSubjects, id: \.self) { subject in
                    Section(header: Text(subject).font(.headline).foregroundColor(.primary)) {
                        ForEach(viewModel.frameworksForSubject(subject), id: \.frameworkID) { usedFramework in
                            Text("\(usedFramework.frameworkValue)")
                                .typographyStyle(.subheadline)
                                .padding()
                                .background(
                                    LinearGradient(gradient: Gradient(colors: [Color.blue, Theme.cvTheme]), startPoint: .top, endPoint: .bottom)
                                        .clipShape(RoundedRectangle(cornerRadius: 15, style: .continuous))
                                        .shadow(color: Theme.text.opacity(0.2), radius: 2, x: 0, y: 1)
                                )
                                .foregroundColor(.white)
                                .frame(width: UIScreen.main.bounds.width / 2, height: UIScreen.main.bounds.width / 2 * buttonAspectRatio)
                        }
                    }
                }
            }
            .navigationTitle("Frameworks")
        }
    }
}

struct FrameworkVC_Previews: PreviewProvider {
    static var previews: some View {
        FrameworkVC(viewModel: CVViewModel())
    }
}

extension CVViewModel {
    var uniqueFrameworkSubjects: [String] {
        Set(showCVObject.flatMap { $0.frameworks.map(\.frameworkSubject) }).sorted()
    }

    func frameworksForSubject(_ subject: String) -> [Frameworks] {
        showCVObject.flatMap { $0.frameworks.filter { $0.frameworkSubject == subject } }
    }
}
*/
