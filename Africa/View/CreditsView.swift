//
//  CreditsView.swift
//  Africa
//
//  Created by Uday on 01/11/23.
//

import SwiftUI

struct CreditsView: View {
    
    
    var body: some View {
        VStack {
            Image("compass")
                .resizable()
                .scaledToFit()
                .frame(width: 128, height: 128)
            Text("""
Copyright © Uday Babariya
All right reserved
Better Apps ♡ Less Code
""")
            .font(.footnote)
            .multilineTextAlignment(.center)
        } //: VStack
        .padding()
        .opacity(0.4)
    }
      
}

#Preview(traits: .sizeThatFitsLayout) {
    CreditsView()
}
