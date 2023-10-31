//
//  GalleryView.swift
//  Africa
//
//  Created by Uday on 27/10/23.
//

import SwiftUI

struct GalleryView: View {
    
    // MARK: - Property
    @State private var selectedAnimal: String = "lion"
    let animals: [Animal] = Bundle.main.decode("animals.json")
    let haptics = UIImpactFeedbackGenerator(style: .medium)
    
    // Simple Grid Defination
    //let gridLayout: [GridItem] = [
    //    GridItem(.flexible(minimum: 0, maximum: .infinity)),
    //    GridItem(.flexible(minimum: 0, maximum: .infinity)),
    //    GridItem(.flexible(minimum: 0, maximum: .infinity))
    //]
    
    // Efficient Grid Defination
//    let gridLayout: [GridItem] = Array(repeating: GridItem(.flexible(minimum: 0, maximum: .infinity)), count: 3)
    
    
    // Dynamic Grid Layout
    @State private var gridLayout: [GridItem] = [GridItem(.flexible(minimum: 0, maximum: .infinity))]
    @State private var gridColumn: Double = 3.0
    
    func gridSwitch() {
        gridLayout = Array(repeating: .init(.flexible(minimum: 0, maximum: .infinity)), count: Int(gridColumn))
    }
    
    // MARK: - Body
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            
            VStack(alignment:. center, spacing: 30) {
                
            // MARK: - Image
                Image(selectedAnimal)
                    .resizable()
                    .scaledToFit()
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.white, lineWidth: 8))
                
             // MARK: - Slider
                Slider(value: $gridColumn, in: 2...4, step: 1)
                    .padding(.horizontal)
                    .onChange(of: gridColumn) { oldValue, newValue in
                        gridSwitch()
                    }
            
                
            // MARK: - Grid
                LazyVGrid(columns: gridLayout, alignment: .center, spacing: 10, content: {
                    ForEach(animals) { item in
                        Image(item.image)
                            .resizable()
                            .scaledToFit()
                            .clipShape(Circle())
                            .overlay(Circle().stroke(Color.white, lineWidth: 1))
                            .onTapGesture {
                                selectedAnimal = item.image
                                haptics.impactOccurred()
                            }
                    } // : Loop
                })// : Grid
                .animation(.easeIn)
                .onAppear(perform: {
                    gridSwitch()
                })
            } // : VStack
            .padding(.horizontal,10)
            .padding(.vertical, 15)
        } //: Scroll
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(MotionAnimationView())
    }
}

//#Preview {
//    GalleryView()
//}
