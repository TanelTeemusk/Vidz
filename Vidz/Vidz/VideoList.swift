//
//  ListVideos.swift
//  Vidz
//
//  Created by Tanel Teemusk on 19.05.2020.
//  Copyright © 2020 Teemusk. All rights reserved.
//

import SwiftUI

struct VideoList: View {
    
    var body: some View {
        
        let videos = videoData
     
        return NavigationView {
          
            List(videos) { video in
                NavigationLink(destination: VideoDetails(data: video)) {
                    VideoRow(data: video)
                } //navigationLink
            } //List
            .navigationBarTitle(Text("Videos"))
        } //NavigationView
        
    } //View
    
} //VideoList

struct ListVideos_Previews: PreviewProvider {
    static var previews: some View {
        VideoList()
    }
}
