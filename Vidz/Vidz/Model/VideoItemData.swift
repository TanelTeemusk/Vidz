//
//  TestData.swift
//  Vidz
//
//  Created by Tanel Teemusk on 19.05.2020.
//  Copyright © 2020 Teemusk. All rights reserved.
//

import SwiftUI

struct VideoItemData: Hashable, Codable, Identifiable {
    var id: Int
    var name: String
    var thumbnailUrl: String
    var url: String
}

extension VideoItemData {
    var thumbnail: Image {
        ImageStore.shared.image(name: thumbnailUrl)
    }
}
