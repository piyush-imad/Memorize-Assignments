//
//  Memorize_AssignmentsApp.swift
//  Memorize-Assignments
//
//  Created by Piyush Sharma on 03/03/23.
//

import SwiftUI

@main
struct Memorize_AssignmentsApp: App {
    let game = EmojiMemoryGame()
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: game)
        }
    }
}
