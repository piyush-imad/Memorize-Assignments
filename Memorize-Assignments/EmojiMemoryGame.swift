//
//  EmojiMemoryGame.swift
//  Memorize-Assignments
//
//  Created by Piyush Sharma on 09/03/23.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    static func createMemoryGame(theme: Themes.Theme) -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairsOfCards: theme.numberOfPairsOfCardsToShow){ pairIndex in
            theme.emojis[pairIndex]
        }
    }
    
    init() {
        theme = Themes().getRandomTheme()
        model = EmojiMemoryGame.createMemoryGame(theme: theme)
    }
    
    @Published private var model: MemoryGame<String>
    
    var theme: Themes.Theme
    
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
    
    // MARK: - Intent(s)
    
    func choose(_ card: MemoryGame<String>.Card) {
        model.choose(card)
    }
    
    func getThemeColor() -> Color {
        var themeColor: Color
        
        switch theme.color {
        case .red:
            themeColor = Color.red
        case .orange:
            themeColor = Color.orange
        case .blue:
            themeColor = Color.blue
        }
        
        return themeColor
    }
    
    func getGameScore() -> Int {
        return model.gameScore
    }
    
    func newGame() {
        theme = Themes().getRandomTheme()
        model = EmojiMemoryGame.createMemoryGame(theme: theme)
    }
}
