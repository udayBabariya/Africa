//
//  MapVIew.swift
//  Africa
//
//  Created by Uday on 27/10/23.
//

import SwiftUI
import MapKit

struct MapView: View {
    
    //MARK: - Properties
    
    @State private var region: MKCoordinateRegion = {
        var mapCordinates = CLLocationCoordinate2D(latitude: 6.600286, longitude: 16.4377599)
        var mapZoomLevel = MKCoordinateSpan(latitudeDelta: 70.0, longitudeDelta: 70.0)
        var mapRegion = MKCoordinateRegion(center: mapCordinates, span: mapZoomLevel)
        return mapRegion
    }()
    
    let locations: [NationalParkLocation] = Bundle.main.decode("locations.json")
    
    //MARK: - Body
    var body: some View {
       
        //MARK: - 1 basic map
       // Map(coordinateRegion: $region)
        
        //MARK: - 2 Advance map
        Map(coordinateRegion: $region, annotationItems: locations) { item in
            // (A) PIN: Old Style (always static)
//            MapPin(coordinate: item.location, tint: .accent)
            
            // (B) MARKER: New Stayle (always static)
//            MapMarker(coordinate: item.location, tint: .accent)
            
            // (C) Custome Basic Annotation ( it could be interactive)
//            MapAnnotation(coordinate: item.location) {
//                Image("logo")
//                    .resizable()
//                    .scaledToFit()
//                    .frame(width: 33, height: 32, alignment: .center)
//            }
            
            // (D)  Custom Advance Annotation ( it could be interactive)
            MapAnnotation(coordinate: item.location) {
                MapAnnotationView(location: item)
            }
        } // : MAP
        .overlay(
            HStack(alignment: .center, spacing: 12) {
                Image("compass")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 48, height: 48, alignment: .center)
                
                VStack(alignment: .leading, spacing: 3) {
                    HStack {
                        Text("Latitude:")
                            .font(.footnote)
                            .fontWeight(.bold)
                            .foregroundColor(.accentColor)
                        Spacer()
                        Text("\(region.center.latitude)")
                            .font(.footnote)
                            .foregroundColor(.white)
                    } //:HStack
                    
                    Divider()
                    
                    HStack {
                        Text("Longitude:")
                            .font(.footnote)
                            .fontWeight(.bold)
                            .foregroundColor(.accentColor)
                        Spacer()
                        Text("\(region.center.longitude)")
                            .font(.footnote)
                            .foregroundColor(.white)
                    } //:HStack
                } //: VStacl
            } // : HStack
                .padding(.vertical, 12)
                .padding(.horizontal, 16)
                .background(
                    Color.black
                        .cornerRadius(8)
                        .opacity(0.6)
                )
                .padding()
            , alignment: .top
        )
    }
}

//#Preview {
//    MapView()
//}
