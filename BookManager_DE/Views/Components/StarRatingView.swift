//
//  StarRatingView.swift
//  BookManager_DE
//
//  Created by David Emery on 2/22/26.
//

import SwiftUI

struct StarRatingView: View {
    var rating: Int
    
    var body: some View {
        HStack(spacing: 0) {
            ForEach(1...5, id: \.self) { index in
                Image(systemName: index <= rating ? "star.fill" : "star")
                    .font(.title2)
                    .foregroundColor(.yellow)
            }
        }
        .accessibilityElement(children: .ignore)
        .accessibilityLabel("Rating: \(rating) out of 5")
    }
}
