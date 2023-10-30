//
//  ContentView.swift
//  Africa
//
//  Created by Uday on 27/10/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        //MARK: - Property
        let animals: [Animal] = Bundle.main.decode("animals.json")
        
        
        //MARK: - Body
        NavigationView {
            List {
                CoverImageView()
                    .frame(height: 300)
                    .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                
                ForEach(animals) { animal in
                    NavigationLink(destination: AnimalDetailView(animal: animal)) {
                        AnimalListItemView(animal: animal)
                    } //: NavigationLink
                } //: Loop
            } //: List
            .navigationBarTitle("Africa", displayMode: .large)
        } //: Navigation
        
    }
}

//#Preview {
//    ContentView()
//}
