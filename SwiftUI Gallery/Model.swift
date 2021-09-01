//
//  Model.swift
//  Model
//
//  Created by Yongqi Xu on 2021-09-01.
//

import SwiftUI

class Gallery: ObservableObject {
    @Published var imageRows: [ImageRow]
    init(imageRows: [ImageRow]) {
        self.imageRows = imageRows
    }
}

struct ImageRow: Identifiable {
    enum RowContent {
        case singleImage(Image)
        case imageGroup([Image])
        case imageRow([Image])
    }
    
    let content: RowContent
    let id = UUID()
}
