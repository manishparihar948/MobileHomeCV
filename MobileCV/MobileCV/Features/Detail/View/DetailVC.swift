//
//  DetailVC.swift
//  MobileCV
//
//  Created by Manish Parihar on 27.12.23.
//

import SwiftUI

struct DetailVC: View {
    
    
    private let columns = Array(repeating: GridItem(.flexible()), count: 1)
    
    /*
    var body: some View {
        ZStack {
            background
            
            /*
             List {
             ForEach(data, id: \.0) { item in
             /*
              VStack(alignment: .leading, spacing:5){
              Text(item.0)
              Text(item.1)
              }.padding()
              .background(Color.blue)
              .cornerRadius(10)
              */
             }
             }
             */
            
            ScrollView {
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(0...1, id:\.self){item in
                        
                        VStack(spacing: .zero) {
                            ZStack {
                                Rectangle()
                                    .fill(
                                        LinearGradient(gradient: Gradient(colors: [.purple, .blue]), startPoint: .top, endPoint: .bottom)
                                        
                                    )
                                    .frame(height: 150)
                                
                                VStack(alignment:.leading) {
                                    Text("\(item): Hello World")
                                        .font(
                                            .system(.caption, design: .rounded)
                                            .bold()
                                        )
                                        .foregroundStyle(.white)
                                        .padding(.horizontal, 20)
                                        .padding(.vertical,10)
                                        .background(Color.green, in:Capsule())
                                }
                                
                            }
                            .frame(maxWidth:.infinity, alignment:.leading)
                            .padding(.horizontal, 10)
                            .padding(.vertical, 5)
                            .background(Color.white)
                            
                            
                        }
                        .clipShape(RoundedRectangle(cornerRadius: 15, style: .continuous))
                        .shadow(color:Theme.text.opacity(0.2), radius:2, x:0, y:1)
                    }
                }
                .padding()
            }
            
        }
    }
     */
    
    var body: some View {
           ZStack {
               background

               ScrollView {
                   LazyVGrid(columns: columns, spacing: 10) {
                       ForEach(0...2, id:\.self){item in
                           VStack(spacing: .zero) {
                               VStack(alignment:.leading) {
                                   Text("Designation")
                                       .typographyStyle(.detail_subheadline)
                                       .foregroundStyle(.white)
                                   
                                   Text("\(item):Company Name")
                                       .typographyStyle(.detail_headline)
                                       .foregroundStyle(.white)

                                   Text("Duration:")
                                       .typographyStyle(.body)
                                       .foregroundStyle(.white)
                                   
                                       Text("Company Location:")
                                           .typographyStyle(.detail_body)
                                           .foregroundStyle(.white)
                                   
                               }
                               .frame(maxWidth:.infinity, alignment:.leading)
                               .padding(.all)
                               .background(
                                LinearGradient(gradient: Gradient(colors: [Theme.eggPlant, Theme.cvTheme]), startPoint: .top, endPoint: .bottom)
                                       .clipShape(RoundedRectangle(cornerRadius: 15, style: .continuous))
                                       .shadow(color:Theme.text.opacity(0.2), radius:2, x:0, y:1)
                               )
                           }
                           .clipShape(RoundedRectangle(cornerRadius: 15, style: .continuous))
                           .shadow(color:Theme.text.opacity(0.2), radius:2, x:0, y:1)
                       }
                   }
                   .padding()
               }
           }
       }
}



struct DetailVC_Previews: PreviewProvider {
    /*
     private static var previewUserId: Int {
     let cvItems = try! StaticJSONMapper.decode(file: "CV",
     type: Item.self)
     return cvItems.data.id
     }
     */
    
    static var previews: some View {
        DetailVC()
    }
}

private extension DetailVC {
    var background: some View {
        Theme.background
            .ignoresSafeArea(.all)
    }
}
