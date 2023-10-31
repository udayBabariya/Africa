//
//  MapAnnotationView.swift
//  Africa
//
//  Created by Uday on 30/10/23.
//

import SwiftUI

struct MapAnnotationView: View {
    
    //MARK: - Properties
    
    var location: NationalParkLocation
    @State private var animation: Double = 0.0
    
    //MARK: - Body
    var body: some View {
        ZStack {
            Circle()
                .fill(Color.accentColor)
                .frame(width: 54, height: 54, alignment: .center)
            
            Circle()
                .stroke(Color.accentColor, lineWidth: 2)
                .frame(width: 52, height: 52, alignment: .center)
                .scaleEffect(1 + CGFloat(animation))
                .opacity(1 - animation)
            
            Image(location.image)
                .resizable()
                .scaledToFit()
                .frame(width: 48, height: 48, alignment: .center)
            .clipShape(.circle)
        } // :ZStack
        .onAppear() {
            withAnimation(Animation.easeInOut(duration: 2).repeatForever(autoreverses: false)) {
                animation = 1
            }
        }
    }
}

//#Preview(traits: .sizeThatFitsLayout) {
//
//    struct previewWrapper: View {
//
//        let locations: [NationalParkLocation] = Bundle.main.decode("locations.json")
//        var body: some View{
//            MapAnnotationView(location: locations[0])
//                .padding()
//        }
//    }
//    return previewWrapper()
//}
