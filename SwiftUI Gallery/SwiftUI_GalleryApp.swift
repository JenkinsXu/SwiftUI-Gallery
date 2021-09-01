//
//  SwiftUI_GalleryApp.swift
//  SwiftUI Gallery
//
//  Created by Yongqi Xu on 2021-09-01.
//

// This project was inspired by Apple's WWDC 2020 session "Stacks, Grids, and Outlines in SwiftUI"

import SwiftUI

@main
struct SwiftUI_GalleryApp: App {
    @StateObject var gallery = Gallery(imageRows: [
        ImageRow(content: .singleImage(Image("mountain-1"))),
        ImageRow(content: .imageGroup([Image("mountain-2"),
                                       Image("mountain-3"),
                                       Image("mountain-4")])),
        ImageRow(content: .imageRow([Image("mountain-5"),
                                     Image("mountain-6"),
                                     Image("mountain-7")])),
        ImageRow(content: .singleImage(Image("mountain-8"))),
        ImageRow(content: .imageGroup([Image("mountain-9"),
                                       Image("mountain-10"),
                                       Image("mountain-11")])),
        ImageRow(content: .imageRow([Image("mountain-12"),
                                     Image("mountain-13"),
                                     Image("mountain-14")])),
    ])
    
    var body: some Scene {
        WindowGroup {
             ContentView(rows: gallery.imageRows)
        }
    }
}
