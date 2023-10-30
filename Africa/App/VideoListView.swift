//
//  VideoListView.swift
//  Africa
//
//  Created by Uday on 27/10/23.
//

import SwiftUI

struct VideoListView: View {
    
    //MARK: - Properties
    @State var videos: [Video] = Bundle.main.decode("videos.json")
    
    //MARK: - Body
    var body: some View {
        NavigationView {
            List {
                ForEach(videos) { item in
                    NavigationLink(destination: VideoPlayerView(videoSelected: item.id, videoTitle: item.name)) {
                        VideoListItemView(video: item)
                             .padding(.vertical, 8)
                    }
                }
            } //: List
            .listStyle(.insetGrouped)
            .navigationBarTitle("Videos", displayMode: .inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        // Shuffle Videos
                        videos.shuffle()
                    } label: {
                        Image(systemName:"arrow.2.squarepath")
                    }
                }
            }
        } //: Navigation
    }
}
//
//#Preview {
//    VideoListView()
//}
