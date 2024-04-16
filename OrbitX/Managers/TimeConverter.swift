//
//  TimeConverter.swift
//  OrbitX
//
//  Created by Aakash  Bondwal  on 16/04/24.
//

import Foundation

func convertTimestampToReadableDate(_ timestamp: String) -> String {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
    
    if let date = dateFormatter.date(from: timestamp) {
        let readableDateFormatter = DateFormatter()
        readableDateFormatter.dateFormat = "d MMM, yyyy"
        return readableDateFormatter.string(from: date)
    } else {
        return "Invalid Date"
    }
}
