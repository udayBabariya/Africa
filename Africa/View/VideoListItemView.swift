//
//  VideoListItem.swift
//  Africa
//
//  Created by Uday on 30/10/23.
//

import SwiftUI

struct VideoListItemView: View {
    
    //MARK: - Property
    let video: Video
    
    //MARK: - Body
    
    var body: some View {
        HStack(spacing: 10) {
            ZStack {
                Image(video.thumbnail)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 80)
                .cornerRadius(9)
                
            Image(systemName: "play.circle")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 32)
                    .shadow(radius: 4)
            } //: ZStack
            
            VStack(alignment: .leading, spacing: 10){
                Text(video.name)
                    .font(.title2)
                    .fontWeight(.heavy)
                    .foregroundStyle(.accent)
                
                Text(video.headline)
                    .font(.footnote)
                    .multilineTextAlignment(.leading)
                    .lineLimit(2)
            } //: VStack
        } //: HStack
    }
}

//#Preview(traits: .sizeThatFitsLayout) {
//    
//    struct previewWrapper: View {
//        let videos: [Video] = Bundle.main.decode("videos.json")
//        
//        var body: some View {
//            VideoListItemView(video: videos[0]).padding()
//        }
//    }
//    
//    return previewWrapper()
//}
