//
//  EducationVC.swift
//  MobileCV
//
//  Created by Manish Parihar on 22.12.23.
//

import SwiftUI

struct EducationVC: View {
    
    var body: some View {
            VStack {
                // Main View
                Color.blue
                    .frame(height: 200) // Adjust the height as needed
                    .ignoresSafeArea(edges: .top)


                // First Horizontal Stack
                HStack {
                    Text("First HStack")
                    Spacer()
                }
                .frame(height: 200)
                .padding(.horizontal,10)
                .padding(.vertical)
                .background(Color.green)
                
                // Second Horizontal Stack
                HStack {
                    Text("Second HStack")
                    Spacer()
                }
                .frame(height: 200)
                .padding(.horizontal,10)
                .padding(.vertical)
                .background(Color.yellow)
                
                Spacer()

                // Third Horizontal Stack (Overlay)
                HStack {
                    Text("Third HStack (Overlay)")
                        .foregroundColor(.white)
                    Spacer()
                }
                .frame(height: 200)
                .padding(.horizontal,10)
                .padding(.vertical)
                .background(Color.red)
                .clipShape(CustomTopCornerRadius())
            }
            .edgesIgnoringSafeArea(.all)
        }
   
}

#Preview {
    EducationVC()
}

struct CustomTopCornerRadius: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()

        path.move(to: CGPoint(x: rect.minX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.minY + 20))
        path.addArc(center: CGPoint(x: rect.minX + 20, y: rect.minY + 20), radius: 20, startAngle: .degrees(180), endAngle: .degrees(270), clockwise: false)
        path.addLine(to: CGPoint(x: rect.maxX - 20, y: rect.minY))
        path.addArc(center: CGPoint(x: rect.maxX - 20, y: rect.minY + 20), radius: 20, startAngle: .degrees(270), endAngle: .degrees(0), clockwise: false)
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))

        return path
    }
}
