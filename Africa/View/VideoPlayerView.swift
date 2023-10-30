//
//  VideoPlayerView.swift
//  Africa
//
//  Created by Uday on 30/10/23.
//

import SwiftUI
import AVKit

struct VideoPlayerView: View {
    //MARK: - Properties
    var videoSelected: String
    var videoTitle: String
    
    //MARK: - Boday
    var body: some View {
        VStack {
            VideoPlayer(player: playVideo(fileName: videoSelected, fileFormat: "mp4")) {
//                Text(videoTitle)
            }
            .overlay(
                Image("logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 34, height: 32)
                    .padding(.top,6)
                    .padding(.horizontal, 8)
                , alignment: .topLeading
            )
        } //: VStack
        .accentColor(.accent)
        .navigationBarTitle(videoTitle, displayMode: .inline)
    }
}

//#Preview(traits: .sizeThatFitsLayout) {
//
//    struct previewWrapper: View {
//
//        var body: some View {
//            NavigationView {
//                VideoPlayerView(videoSelected: "lion", videoTitle: "Zebra")
//            }
//        }
//    }
//    return previewWrapper()
//}
