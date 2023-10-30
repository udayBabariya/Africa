//
//  HeadingView.swift
//  Africa
//
//  Created by Uday on 29/10/23.
//

import SwiftUI

struct HeadingView: View {
    //MARK: - Properties
    var headingImage: String
    var headingText: String
    
    //MARK: - Body
    
    var body: some View {
        HStack {
            
            Image(systemName: headingImage)
                .foregroundColor(.accent)
                .imageScale(.large)
            
            Text(headingText)
                .font(.title3)
                .fontWeight(.bold)
        } //: HStack
        .padding(.vertical)
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    HeadingView(headingImage: "photo.on.rectangle.angled", headingText: "Wilderness in Pictures")
        .padding()
}
