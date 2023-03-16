//
//  ContentView.swift
//  Memorize-Assignments
//
//  Created by Piyush Sharma on 03/03/23.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel: EmojiMemoryGame
    var body: some View {
        VStack {
            Text("\(viewModel.theme.name)!")
                .font(.largeTitle)
            Text("Score: \(viewModel.getGameScore())")
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 100))]) {
                    ForEach(viewModel.cards) { card in
                        CardView(card: card, themeColor: viewModel.getThemeColor())
                            .onTapGesture {
                                viewModel.choose(card)
                            }
                    }.aspectRatio(2/3, contentMode: .fit)
                }
            }
            Button(action: {
                viewModel.newGame()
            }, label: {
                Text("New Game")
                    .font(.headline)
            })
        }
        .padding()
    }
}

struct CardView: View {
    var card: MemoryGame<String>.Card
    var themeColor: Color
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 20)
            if card.isFaceUp {
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: 5).foregroundColor(themeColor)
                Text(card.content).font(.largeTitle)
            } else if card.isMatched {
                shape.opacity(0)
            } else {
                shape.fill().foregroundColor(themeColor)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
        ContentView(viewModel: game)
    }
}
