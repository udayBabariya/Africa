//
//  GalleryView.swift
//  Africa
//
//  Created by Uday on 27/10/23.
//

import SwiftUI

struct GalleryView: View {
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            Text("a")
        } //: Scroll
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(MotionAnimationView())
    }
}

//#Preview {
//    GalleryView()
//}
