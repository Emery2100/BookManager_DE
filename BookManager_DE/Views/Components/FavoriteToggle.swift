//
//  FavoriteToggle.swift
//  BookManager_DE
//
//  Created by David Emery on 2/22/26.
//

import SwiftUI

struct FavoriteToggle: View {
    @Binding var isFavorite: Bool
    
    @State private var offsetY: CGFloat = 0
    @State private var scale: CGFloat = 1
    @State private var opacity: CGFloat = 0
    
    var body: some View {
        ZStack{
            Image(systemName: "heart.fill")
                .foregroundStyle(.red)
                .font(.title)
                .opacity(opacity)
                .scaleEffect(scale)
                .offset(y: offsetY)
            Toggle(isOn: $isFavorite){
                Image(systemName: isFavorite ? "heart.fill" : "heart")
                    .foregroundStyle(isFavorite ? .red : .secondary)
                    .font(.title)
            }
            .toggleStyle(.button)
            .buttonStyle(.plain)
            .animation(.spring, value: isFavorite)
        }
    }
}
