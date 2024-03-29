//
//  MemoryGame.swift
//  Memorize-Assignments
//
//  Created by Piyush Sharma on 09/03/23.
//

import Foundation

struct MemoryGame<CardContent> where CardContent: Equatable {
    private(set) var cards: Array<Card>
    private(set) var gameScore:Int = 0
    private var indexOfTheOneAndOnlyFaceUpCard: Int?
    
    mutating func choose(_ card: Card) {
        if let chosenIndex = cards.firstIndex(where: {$0.id == card.id}), !cards[chosenIndex].isFaceUp, !cards[chosenIndex].isMatched {
            if let potentialMatchIndex = indexOfTheOneAndOnlyFaceUpCard {
                if cards[chosenIndex].content == cards[potentialMatchIndex].content {
                    cards[chosenIndex].isMatched = true
                    cards[potentialMatchIndex].isMatched = true
                    gameScore+=2
                } else {
                    gameScore -= cards[chosenIndex].timesSeen + cards[potentialMatchIndex].timesSeen
                    cards[chosenIndex].timesSeen += 1
                    cards[potentialMatchIndex].timesSeen += 1
                }
                indexOfTheOneAndOnlyFaceUpCard = nil
            } else {
                for index in cards.indices {
                    cards[index].isFaceUp = false
                }
                indexOfTheOneAndOnlyFaceUpCard = chosenIndex
            }
            cards[chosenIndex].isFaceUp.toggle()
        }
    }
    
    init(numberOfPairsOfCards: Int, createCardContent: (Int) -> CardContent) {
        cards = Array<Card>()
        for pairIndex in 0..<numberOfPairsOfCards {
            let cardContent = createCardContent(pairIndex)
            cards.append(Card(content: cardContent, id: 2*pairIndex))
            cards.append(Card(content: cardContent, id: 2*pairIndex+1))
        }
        cards = cards.shuffled()
    }
    
    struct Card: Identifiable {
        var content: CardContent
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        var timesSeen: Int = 0
        var id: Int
    }
}
