//
//  ContentView.swift
//  SwiftUI Gallery
//
//  Created by Yongqi Xu on 2021-09-01.
//

import SwiftUI

struct ContentView: View {
    var rows: [ImageRow]
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVStack(spacing: 2) {
                    ForEach(rows) { row in
                        switch row.content {
                        case .singleImage(let image):
                            SingleImageLayout(image: image)
                        case .imageGroup(let images):
                            ImageGroupLayout(images: images)
                        case .imageRow(let images):
                            ImageRowLayout(images: images)
                        }
                    }
                }
            }
            .navigationTitle("Favorite Mountains")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

/// A `View` representing a single image. It takes the full width of an image row.
struct SingleImageLayout: View {
    let image: Image
    var body: some View {
        GeometryReader { proxy in
            image
                .resizable()
                .scaledToFill()
                .frame(width: proxy.size.width - 4, height: 300)
                .clipped()
                .padding(.horizontal, 2)
        }
        .frame(height: 300)
    }
}

/// A `View` representing a row with 3 images, with one on the leading column and 2 on the trailing.
struct ImageGroupLayout: View {
    let images: [Image]
    var body: some View {
        GeometryReader { proxy in
            HStack(spacing: 2) {
                let availableWidth = proxy.size.width - 6
                let largeImageWidth = availableWidth * 2 / 3
                let smallImageWidth = availableWidth * 1 / 3
                
                images[0]
                    .resizable()
                    .scaledToFill()
                    .frame(width: largeImageWidth, height: 200)
                    .clipped()
                
                VStack(spacing: 2) {
                    images[1]
                        .resizable()
                        .scaledToFill()
                        .frame(width: smallImageWidth, height: 99)
                        .clipped()
                    images[2]
                        .resizable()
                        .scaledToFill()
                        .frame(width: smallImageWidth, height: 99)
                        .clipped()
                }
            }
            .padding(.horizontal, 2)
        }
        .frame(height: 200)
    }
}

/// A `View` representing 3 images in an image row.
struct ImageRowLayout: View {
    let images: [Image]
    var body: some View {
        GeometryReader { proxy in
            let imageWidth = (proxy.size.width - 8) / 3
            HStack(spacing: 2) {
                images[0]
                    .resizable()
                    .scaledToFill()
                    .frame(width: imageWidth, height: 100)
                    .clipped()
                images[1]
                    .resizable()
                    .scaledToFill()
                    .frame(width: imageWidth, height: 100)
                    .clipped()
                images[2]
                    .resizable()
                    .scaledToFill()
                    .frame(width: imageWidth, height: 100)
                    .clipped()
            }
            .padding(.horizontal, 2)
        }
        .frame(height: 100)
    }
}

struct ContentView_Previews: PreviewProvider {
    static let gallery = Gallery(imageRows: [
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
    
    static var previews: some View {
        ContentView(rows: gallery.imageRows)
            .preferredColorScheme(.dark)
    }
}
