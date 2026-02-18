//
//  ListItemView.swift
//  BookManager_DE
//
//  Created by David Emery on 2/17/26.
//

import SwiftUI

struct ListItemView: View {
    let book: Book
    
    var body: some View {
        HStack{
            Image(book.cover)
                .resizable()
                .scaledToFit()
                .frame(width: 60, height: 60)
            VStack(alignment: .leading){
                Text(book.title)
                    .font(.headline)
                    .fontWeight(.bold)
                Text(book.author)
            }
        }
    }
}
