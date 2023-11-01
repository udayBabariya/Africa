//
//  CenterModifire.swift
//  Africa
//
//  Created by Uday on 01/11/23.
//

import SwiftUI

struct CenterModifire: ViewModifier {
    
    func body(content: Content) -> some View {
        HStack {
            Spacer()
            content
            Spacer()
        }
    }
}
