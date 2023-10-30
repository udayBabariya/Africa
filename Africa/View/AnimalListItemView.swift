//
//  AnimalListItemView.swift
//  Africa
//
//  Created by Uday on 29/10/23.
//

import SwiftUI

struct AnimalListItemView: View {
    
    //MARK: - Property
    let animal: Animal
    
    // MARK: - Body
    var body: some View {
        HStack(alignment: .center, spacing: 10) {
        
            Image(animal.image)
                .resizable()
                .scaledToFill()
                .frame(width: 90, height: 90)
                .clipShape(
                    RoundedRectangle(cornerRadius: 12)
                )
            
            VStack(alignment: .leading, spacing: 8) {
                Text(animal.name)
                    .font(.title2)
                    .fontWeight(.heavy)
                    .foregroundStyle(.accent)
                
                Text(animal.headline)
                    .font(.footnote)
                    .multilineTextAlignment(.leading)
                    .lineLimit(/*@START_MENU_TOKEN@*/2/*@END_MENU_TOKEN@*/)
                    .padding(.trailing, 8)
            } //: VStack
        } //: HStack
    }
}


#Preview(traits: .sizeThatFitsLayout) {
    
    struct previewWrapper: View {
        let animals: [Animal] = Bundle.main.decode("animals.json")
        
        var body: some View {
            AnimalListItemView(animal: animals[1])
        }
    }
    return previewWrapper()
}
