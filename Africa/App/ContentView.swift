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
    
    @State private var isGridViewActive: Bool = false
    @State private var gridLayout: [GridItem] = [GridItem(.flexible(minimum: 0, maximum: .infinity))]
    @State private var gridColumn = 1
    @State private var toolbarIcon: String = "square.grid.2x2"
    
    // MARK: - functions
    
    func gridSwitch() {
        gridLayout = Array(repeating: .init(.flexible(minimum: 0, maximum: .infinity)), count: gridLayout.count % 3 + 1)
        gridColumn = gridLayout.count
        print("grid number: \(gridColumn)")
        
        //Toolbar Image
        switch gridColumn {
        case 1:
            toolbarIcon = "square.grid.2x2"
        case 2:
            toolbarIcon = "square.grid.3x3"
        case 3:
            toolbarIcon = "rectangle.grid.1x2"
        default:
            toolbarIcon = "square.grid.2x2"
        }
    }
    
    
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
                            gridSwitch()
                        }, label: {
                            Image(systemName: toolbarIcon)
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
