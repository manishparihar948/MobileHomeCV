//
//  TypographyStyle.swift
//  MobileCV
//
//  Created by Manish Parihar on 23.12.23.
//

import SwiftUI

enum TypographyStyle {
    
    case headline
    case subheadline
    case body
    case detail_headline
    case detail_subheadline
    case detail_body
    case detail_thin
    
    private var fontName: String {
        switch self {
        case .headline:
            return "GillSans-Bold"
            
        case .subheadline:
            return "GillSans-SemiBold"
            
        case .body:
            return "GillSans"
            
        case .detail_headline:
            return "AvenirNext-Bold"
            
        case .detail_subheadline:
            return "AvenirNext-Medium"
        
        case .detail_thin:
            return "AvenirNext-UltraLight"
        
        case .detail_body:
            return "AvenirNext-Regular"
        }
    }
    
    private var fontTextStyle: Font.TextStyle {
        switch self {
        case .headline:
            return .headline
        case .subheadline:
            return .subheadline
        case .body:
            return .title
        case .detail_headline:
            return .headline
        case .detail_subheadline:
            return .subheadline
        case .detail_thin:
            return .caption
        case .detail_body:
            return .body
        }
    }
    
    private var fontSize:CGFloat {
        switch self {
        case .headline:
            return 25
        case .subheadline:
            return 20
        case .body:
            return 14
        case .detail_headline:
            return 20
        case .detail_subheadline:
            return 16
        case .detail_thin:
            return 14
        case .detail_body:
            return 12
        }
    }
    
    fileprivate func asFont() -> Font {
        Font.custom(fontName, size: fontSize, relativeTo: fontTextStyle)
    }
    
}

extension View {
    
    func typographyStyle(_ style:TypographyStyle) -> some View {
        font(style.asFont())
    }
}

extension Text {
    
    func typographyStyle(_ style:TypographyStyle) -> some View {
        font(style.asFont())
    }
}



