//
//  VideoModel.swift
//  Africa
//
//  Created by Uday on 30/10/23.
//

import UIKit

struct Video: Identifiable, Codable {
    let id: String
    let name: String
    let headline: String
    
    //Computed Property
    var thumbnail: String {
        "video-\(id)"
    }
}
