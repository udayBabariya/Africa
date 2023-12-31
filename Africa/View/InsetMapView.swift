//
//  InsetMapView.swift
//  Africa
//
//  Created by Uday on 29/10/23.
//

import SwiftUI
import MapKit

struct InsetMapView: View {
    
    //MARK: - Properties
    @State private var region =  MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 6.600286, longitude: 16.4377599), span: MKCoordinateSpan(latitudeDelta: 60.0, longitudeDelta: 60.0))
    
    //MARK: - Body
    var body: some View {
        Map(coordinateRegion: $region)
            .overlay(
                NavigationLink(destination: MapView()) {
                    HStack {
                        Image(systemName: "mappin.circle")
                            .foregroundColor(.white)
                            .imageScale(.large)
                        
                        Text("Locations")
                            .foregroundStyle(.accent)
                            .fontWeight(.bold)
                    } //: HStack
                    .padding(.vertical,10)
                    .padding(.horizontal,14)
                    .background(
                        Color.black
                            .opacity(0.4)
                            .cornerRadius(8)
                    )
                    
                } //: Navigation
                    .padding(12)
                ,alignment: .topTrailing
            )
            .frame(height: 256)
            .cornerRadius(12)
        
    }
}

//#Preview(traits: .sizeThatFitsLayout) {
//    
//    struct previewWrapper: View {
//        
//        
//        var body: some View{
//            InsetMapView()
//                .padding()
//        }
//    }
//    return previewWrapper()
//}
