//
//  DetailView.swift
//  Bookwarm
//
//  Created by Leila on 2/1/24.
//

import SwiftData
import SwiftUI

struct DetailView: View {
    let book: Book
    
    var body: some View {
        ScrollView {
            ZStack(alignment: .bottomTrailing) {
                Image(book.genre)
                    .resizable()
                    .scaledToFit()
                Text(book.genre.uppercased())
                    .fontWeight(.heavy)
                    .padding(9)
                    .foregroundStyle(.white)
                    .background(.black.opacity(0.7))
                    .clipShape(.capsule)
                    .offset(x: -8, y: -10)
            }
            Text(book.author)
                .font(.title)
                .padding()
            Text(book.review)
                .padding()
            RatingView(rating: .constant(book.rating))
                .font(.largeTitle)
        }
        .navigationTitle(book.title)
        .toolbarTitleDisplayMode(.inline)
        .scrollBounceBehavior(.basedOnSize)
    }
}

#Preview {
    do {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try ModelContainer(for: Book.self, configurations: config)
        let example = Book(title: "TEST BOOK", author: "TEST AUTHOR", genre: "Mystery", review: "TEST REVIEW", rating: 5)
        
        return DetailView(book: example)
            .modelContainer(container)
    } catch {
        return Text("Failed to create preview: \(error.localizedDescription)")
    }
}