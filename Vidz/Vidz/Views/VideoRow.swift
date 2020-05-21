//
//  TestRow.swift
//  Vidz
//
//  Created by Tanel Teemusk on 19.05.2020.
//  Copyright © 2020 Teemusk. All rights reserved.
//

import SwiftUI

struct VideoRow: View {
    var data: VideoItemData
    
    var body: some View {
        return HStack(spacing: 12) {
            data.thumbnail
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 50, height: 50)
                .clipped()
            Text("\(data.name)")
            Spacer()
        }
        
    }
}

struct TestRow_Previews: PreviewProvider {
    static var previews: some View {
        let data = VideoItemData(id: 0, name: "Cool video", thumbnailUrl: "stmarylake.jpg", url: "https://teemusk.com/temp/videos/01.mp4")
        
        return Group {
            VideoRow(data: data)
        }
        .previewLayout(.fixed(width: 350, height: 70))
        
    }
}
