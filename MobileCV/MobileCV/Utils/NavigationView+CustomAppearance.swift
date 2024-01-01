//
//  NavigationView.swift
//  MobileCV
//
//  Created by Manish Parihar on 21.12.23.
//

import SwiftUI

extension View {
    func customNavigationView(backgroundColor: Color) -> some View {
        modifier(CustomNavigationViewModifier(backgroundColor: backgroundColor))
    }
}

struct CustomNavigationViewModifier: ViewModifier {
    var backgroundColor: Color

    func body(content: Content) -> some View {
        content
            .navigationBarColor(backgroundColor)
    }
}

extension View {
    func navigationBarColor(_ backgroundColor: Color) -> some View {
        modifier(NavigationBarColorModifier(backgroundColor: backgroundColor))
    }
}

struct NavigationBarColorModifier: ViewModifier {
    var backgroundColor: Color

    init(backgroundColor: Color) {
        self.backgroundColor = backgroundColor
    }

    func body(content: Content) -> some View {
        content
            .onAppear {
                let coloredAppearance = UINavigationBarAppearance()
                coloredAppearance.configureWithOpaqueBackground()
                coloredAppearance.backgroundColor = UIColor(backgroundColor)
                coloredAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
                coloredAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]

                UINavigationBar.appearance().standardAppearance = coloredAppearance
                UINavigationBar.appearance().compactAppearance = coloredAppearance
                UINavigationBar.appearance().scrollEdgeAppearance = coloredAppearance
                UINavigationBar.appearance().tintColor = UIColor(Theme.cvTheme)
            }
    }
}
