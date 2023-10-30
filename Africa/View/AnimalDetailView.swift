//
//  AnimalDetailView.swift
//  Africa
//
//  Created by Uday on 29/10/23.
//

import SwiftUI

struct AnimalDetailView: View {
    
    //MARK: - Property
    let animal: Animal
    
    //MARK: - Body
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .center, spacing: 20) {
    
                //HERO Image
                Image(animal.image)
                    .resizable()
                    .scaledToFit()
                
                // Title
                Text(animal.name.uppercased())
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .multilineTextAlignment(.center)
                    .padding(.vertical, 8)
                    .foregroundColor(.primary)
                    .background(
                        Color.accentColor
                            .frame(height: 6)
                            .offset(y:24)
                    )
                
                // HeadLine
                Text(animal.headline)
                    .font(.headline)
                    .multilineTextAlignment(.leading)
                    .foregroundColor(.accent)
                    .padding(.horizontal)
                
                // Gallery
                Group {
                    HeadingView(headingImage: "photo.on.rectangle.angled", headingText: "Wilderness in Pictures")
                    
                    InsetGalleryView(animal: animal)
                }
                .padding(.horizontal)
                
                //Fact
                Group {
                    HeadingView(headingImage: "questionmark.circle", headingText: "Did You Know?")
                    
                    InsectFactView(animal: animal)
                }
                .padding(.horizontal)
                
                //Description
                Group {
                    HeadingView(headingImage: "info.circle", headingText: "All about \(animal.name)")
                    Text(animal.description)
                        .multilineTextAlignment(.leading)
                        .layoutPriority(1)
                }
                .padding(.horizontal)
                
                // Map
                Group {
                   HeadingView(headingImage: "map", headingText: "National Parks")
                    InsetMapView()
                }
                .padding(.horizontal)
                
                //Link
                Group {
                    HeadingView(headingImage: "books.vertical", headingText: "Learn more")
                    ExternalWebLinkView(animal: animal)
                }
                .padding(.horizontal)
                
                
            } //" VStack
            .navigationBarTitle("Learn About \(animal.name)", displayMode: .inline)
        } //: ScrollView
    }
}

#Preview {
    struct previewWrapper: View {
        let animals: [Animal] = Bundle.main.decode("animals.json")
        
        var body: some View {
            NavigationView {
                AnimalDetailView(animal: animals[0])
            }
        }
    }
    return previewWrapper()
}

