//
//  CVViewModel.swift
//  MobileCV
//
//  Created by Manish Parihar on 13.07.23.
//

import Foundation

class CVViewModel: ObservableObject {
    @Published var showCVObject : [ItemData] = []
    
    @Published var isLoading = false
    
    var error: Error?
    
    @MainActor
    func fetchCVDataFromAPI() async {
        // When fetching data
        isLoading = true
        
        guard let url = Bundle.main.url(forResource: "CV", withExtension: "json") else {
            // When a file not found error occurs
            self.isLoading = false
            return
        }
        
        // Convert to JSON
        do {
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
            
            let showCVObject = try decoder.decode(Item.self, from: data)
            
            // When data fetch is successful
            self.showCVObject = showCVObject.data
            self.isLoading = false
            // print("CV Object",showCVObject.data)
        } catch {
            // When an error occurs during JSON decoding
            self.isLoading = false
            self.error = error
            print("Error",error)
        }
        
    }
}
