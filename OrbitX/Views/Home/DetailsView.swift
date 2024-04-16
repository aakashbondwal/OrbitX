//
//  DetailsView.swift
//  OrbitX
//
//  Created by Aakash  Bondwal  on 16/04/24.
//


import SwiftUI

struct DetailsView: View {
    let result: Results
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            
            Text(result.news_site)
                .foregroundStyle(.red)
            
            Text(convertTimestampToReadableDate(result.published_at))
                .font(.caption)
            
            Text(result.title)
                .font(.title2)
                .bold()
            
            Text(result.summary)
                .font(.callout)
            
            Text(result.url)
                .font(.callout)
            
            Text("Author: \(result.news_site)")
                .font(.caption)
            
            
        }
        .foregroundStyle(.white)
        .multilineTextAlignment(.leading)
        .bold()
        .padding()
    }
}

