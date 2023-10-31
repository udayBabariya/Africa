//
//  AnimalGridItemView.swift
//  Africa
//
//  Created by Uday on 31/10/23.
//

import SwiftUI

struct AnimalGridItemView: View {
    
    //MARK: - Properties
    let animal: Animal
    
    //MARK: - Body
    var body: some View {
        Image(animal.image)
            .resizable()
            .scaledToFit()
            .cornerRadius(12)
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    struct preivewWrapper: View {
        
        let animals: [Animal] = Bundle.main.decode("animals.json")
        
        var body: some View {
            AnimalGridItemView(animal: animals[0])
                .padding()
        }
    }
    return preivewWrapper()
}
