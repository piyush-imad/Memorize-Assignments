//
//  Theme.swift
//  Memorize-Assignments
//
//  Created by Piyush Sharma on 09/03/23.
//

import Foundation

enum ThemeColor: String {
    case red = "red"
    case blue = "blue"
    case orange = "orange"
}

struct Themes {
    static let defaultTheme = Theme(emojis: ["✈️","🚚","🚕","🛫","🚛","🚙","🚘","🚀"],
                                    color: .orange,
                                    numberOfPairsOfCardsToShow: 8,
                                    name: "Vehicles")
    
    let themes = [defaultTheme,
                  Theme(emojis: ["✝️","⛪️","🎄","🎅🏻","🇨🇽","🤶🏼"],
                        color: .red,
                        numberOfPairsOfCardsToShow: 6,
                        name: "Christmas"),
                  Theme(emojis: ["👩🏻‍🦰","👨‍👩‍👦","🚶🏻‍♂️","🧍🏽‍♂️","👨‍👦‍👦","👬"],
                        color: .blue,
                        numberOfPairsOfCardsToShow: 4,
                        name: "People")]
    
    func getRandomTheme() -> Theme {
        var theme = themes.randomElement() ?? Themes.defaultTheme
        theme.emojis = theme.emojis.shuffled()
        if theme.emojis.count < theme.numberOfPairsOfCardsToShow {
            theme.numberOfPairsOfCardsToShow = theme.emojis.count
        }
        return theme
    }
    
    struct Theme {
        var emojis: Array<String>
        var color: ThemeColor
        var numberOfPairsOfCardsToShow: Int
        var name: String
    }
}
