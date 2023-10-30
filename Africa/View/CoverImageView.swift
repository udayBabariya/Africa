//
//  CoverImageView.swift
//  Africa
//
//  Created by Uday on 29/10/23.
//

import SwiftUI

struct CoverImageView: View {
    
    //MARK: - Property
    let coverImages: [CoverImage] = Bundle.main.decode("covers.json")
    
    //MARK: - Body
    var body: some View {
        
        TabView {
            ForEach(coverImages) { item in
                Image(item.name)
                    .resizable()
                    .scaledToFill()
            } //: loop
        } //: Tab
        .tabViewStyle(PageTabViewStyle())
        
    }
}

//MARK: - Preview
//#Preview(traits: .fixedLayout(width: 400, height: 300)) {
//    CoverImageView()
//}

