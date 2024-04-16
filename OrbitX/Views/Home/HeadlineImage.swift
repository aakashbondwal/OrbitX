//
//  HeadlineImage.swift
//  OrbitX
//
//  Created by Aakash  Bondwal  on 16/04/24.
//


import SwiftUI
import SDWebImageSwiftUI

struct HeadlineImageView: View {
    
    @Binding var disclosed: Bool
    let result: Results
    var size: CGSize
    var safeArea: EdgeInsets
    
    var body: some View {
        GeometryReader {_ in
            
            AnimatedImage(url: URL(string: result.image_url)) {
                ProgressView()
            }
            .resizable()
            .aspectRatio(contentMode: .fill)
            .overlay {
                Color.black.opacity(disclosed ? 0.6 : 0.3)
            }
            
        }
        
    }
}

