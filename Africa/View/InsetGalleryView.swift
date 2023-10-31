//
//  InsetGalleryView.swift
//  Africa
//
//  Created by Uday on 29/10/23.
//

import SwiftUI

struct InsetGalleryView: View {
    
    //MARK: - Properties
    let animal: Animal
    
    //MARK: - Body
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(alignment: .center, spacing: 15) {
                ForEach(animal.gallery, id: \.self) { item in
                    Image(item)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 200)
                    .cornerRadius(12)
                } //: Loop
            } //:HStack
        }//: Scroll
    }
}

//#Preview(traits: .sizeThatFitsLayout) {
//    
//    struct previewWrapper: View {
//        let animals: [Animal] = Bundle.main.decode("animals.json")
//        
//        var body: some View {
//            InsetGalleryView(animal: animals[0])
//                .padding()
//        }
//    }
//   return previewWrapper()
//}
