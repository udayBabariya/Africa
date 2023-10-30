//
//  CodableBundleExtension.swift
//  Africa
//
//  Created by Uday on 29/10/23.
//

import Foundation

extension Bundle {
    func decode<T: Codable>(_ file: String) -> T {
        //1. Locate JSON file
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Faile to loacte \(file) in Bundle.")
        }
        
        //2. create a property for the data
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load \(file) from Bundel.")
        }
        
        //3. create a decoder
        let decoder = JSONDecoder()
        
        //4. create a property for the decoded data
        guard let loaded = try? decoder.decode(T.self, from: data) else {
            fatalError("Failed to decode \(file) from Bundle")
        }
        
        //5. return the ready-to-use data
        return loaded
    }
}
