//
//  InsectFactView.swift
//  Africa
//
//  Created by Uday on 29/10/23.
//

import SwiftUI

struct InsectFactView: View {
    
    //MARK: - Property
    let animal: Animal
    
    //MARK: - Body
    var body: some View {
        GroupBox {
            TabView {
                ForEach(animal.fact, id: \.self) { item in
                    Text(item)
                }
            } // : Tab
            .tabViewStyle(.page)
            .frame(minWidth: 148, idealHeight: 168, maxHeight: 180)
        } //: GroupBox
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    struct previewWrapper: View {
        let animals: [Animal] = Bundle.main.decode("animals.json")
        
        var body: some View {
            InsectFactView(animal: animals[0])
                .padding(/*@START_MENU_TOKEN@*/EdgeInsets()/*@END_MENU_TOKEN@*/)
        }
    }
    return previewWrapper()
}
