//
//  AddBookView.swift
//  Bookwarm
//
//  Created by Leila on 1/28/24.
//

import SwiftUI

struct AddBookView: View {
    @Environment(\.modelContext) var modelContext
    @Environment(\.dismiss) var dismiss
    
    @State private var title = ""
    @State private var author = ""
    @State private var genre = "Fantasy"
    @State private var review = ""
    @State private var rating = 3
    
    let genres = ["Fantasy", "Horror", "Kids", "Mystery", "Poetry", "Romance", "Thriller"]
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("Name of book", text: $title)
                    TextField("Author's name", text: $author)
                    Picker("Genre", selection: $genre) {
                        ForEach(genres, id: \.self) {
                            Text($0)
                        }
                    }
                }
                Section("Write a review") {
                    TextEditor(text: $review)
                    RatingView(rating: $rating)
                }
                Section {
                    Button("Save") {
                        let newBook = Book(title: title, author: author, genre: genre, review: review, rating: rating, date: .now)
                        modelContext.insert(newBook)
                        dismiss()
                    }
                }
                .disabled(title.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty || author.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty)
            }
            .navigationTitle("Add Book")
        }
    }
}

#Preview {
    AddBookView()
}
