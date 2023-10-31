//
//  ContentView.swift
//  Africa
//
//  Created by Uday on 27/10/23.
//

import SwiftUI

struct ContentView: View {
    
    //MARK: - Property
    let animals: [Animal] = Bundle.main.decode("animals.json")
    let haptics = UIImpactFeedbackGenerator(style: .medium)
    let gridLayout: [GridItem] = Array(repeating: GridItem(.flexible(minimum: 0, maximum: .infinity)), count: 2)
    
    @State private var isGridViewActive: Bool = false
    
    var body: some View {
        
        //MARK: - Body
        NavigationView {
            Group {
                if !isGridViewActive {
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
                } else {
                    ScrollView(.vertical, showsIndicators: false) {
                        LazyVGrid(columns: gridLayout, alignment: .center, spacing: 10) {
                            ForEach(animals) { animal in
                                NavigationLink(destination: AnimalDetailView(animal: animal)) {
                                    AnimalGridItemView(animal: animal)
                                } //: Link
                            } //: Loop
                        } //: Grid
                        .padding(10)
                        .animation(.easeIn)
                    } //: Scroll
                } //: Condition
            } //: Group
            .navigationBarTitle("Africa", displayMode: .large)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    HStack(spacing: 16) {
                        //List
                        Button(action: {
                            print("List view")
                            isGridViewActive = false
                            haptics.impactOccurred()
                        }, label: {
                            Image(systemName: "square.fill.text.grid.1x2")
                                .font(.title2)
                                .foregroundColor( isGridViewActive ? .primary : .accentColor)
                        })
                        
                        
                        // Grid
                        Button(action: {
                            print("grid")
                            isGridViewActive = true
                            haptics.impactOccurred()
                        }, label: {
                            Image(systemName: "square.grid.2x2")
                                .font(.title2)
                                .foregroundColor(isGridViewActive ? .accent : .primary)
                        })
                        
                    } //: HStack
                }
            } //: Toolbar
        } //: Navigation
        
    }
}

#Preview {
    ContentView()
}
