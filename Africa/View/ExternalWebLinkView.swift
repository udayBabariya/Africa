//
//  ExternalWebLinkView.swift
//  Africa
//
//  Created by Uday on 29/10/23.
//

import SwiftUI

struct ExternalWebLinkView: View {
    
    //MARK: - Properties
    let animal: Animal
    
    //MARK: - Body
    var body: some View {
        GroupBox {
            HStack {
                Image(systemName: "globe")
                Text("Wikipedia")
                Spacer()
                
                Group {
                    Image(systemName: "arrow.up.right.square")
                    
                    Link(animal.name, destination: URL(string: animal.link) ?? URL(string: "https://google.com")!)
                }
                .foregroundColor(.accent)
            } //:HStack
        } //: GroupBox
    }
}

//#Preview(traits: .sizeThatFitsLayout) {
//   
//    struct previewWrapper: View {
//        
//        let animals: [Animal] = Bundle.main.decode("animals.json")
//        
//        var body: some View {
//            ExternalWebLinkView(animal: animals[0])
//                .padding()
//        }
//    }
//    return previewWrapper()
//}
