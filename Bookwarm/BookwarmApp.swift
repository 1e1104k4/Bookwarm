//
//  BookwarmApp.swift
//  Bookwarm
//
//  Created by Leila on 1/28/24.
//

import SwiftData
import SwiftUI

@main
struct BookwarmApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Book.self)
    }
}
