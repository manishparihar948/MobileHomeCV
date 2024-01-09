//
//  OnBoarding.swift
//  MobileCV
//
//  Created by Manish Parihar on 08.01.24.
//

import Foundation
import SwiftUI

// MARK: - FRUITS DATA MODEL

struct OnBoarding: Identifiable {
  var id = UUID()
  var title: String
  var headline: String
  var image: String
  var gradientColors: [Color]
}
