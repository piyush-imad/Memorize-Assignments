//
//  ContentView.swift
//  Memorize-Assignments
//
//  Created by Piyush Sharma on 03/03/23.
//

import SwiftUI

struct ContentView: View {
    @State var emojis = ["✈️","🚚","🚕","🛫","🚛","🚙","🚘","🚀"]
    var body: some View {
        VStack {
            Text("Memorize!")
                .font(.largeTitle)
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 100))]) {
                    ForEach(emojis, id: \.self) { emoji in
                        CardView(content: emoji)
                    }.aspectRatio(2/3, contentMode: .fit)
                }
            }
            HStack {
                Spacer()
                vehiclesTheme
                Spacer()
                christmasTheme
                Spacer()
                peopleTheme
                Spacer()
            }
            .font(.body)
        }
        .padding()
    }
    
    var vehiclesTheme: some View {
        Button(action: {
            emojis = ["✈️","🚚","🚕","🛫","🚛","🚙","🚘","🚀"].shuffled()
        }, label: {
            VStack {
                Image(systemName: "car.fill")
                Text("Vehicles")
            }
        })
    }
    
    var christmasTheme: some View {
        Button(action: {
            emojis = ["✝️","⛪️","🎄","🎅🏻","🇨🇽","🤶🏼"].shuffled()
        }, label: {
            VStack {
                Image(systemName: "tree.fill")
                Text("Christmas")
            }
        })
    }
    
    var peopleTheme: some View {
        Button(action: {
            emojis = ["👩🏻‍🦰","👨‍👩‍👦","🚶🏻‍♂️","🧍🏽‍♂️","👨‍👦‍👦","👬"].shuffled()
        }, label: {
            VStack {
                Image(systemName: "person.fill")
                Text("People")
            }
        })
    }
}

struct CardView: View {
    @State var isFaceUp = true
    let content: String
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 20)
            if isFaceUp {
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: 5).foregroundColor(.red)
                Text(content).font(.largeTitle)
            } else {
                shape.fill().foregroundColor(.red)
            }
        }
        .onTapGesture {
            isFaceUp = !isFaceUp
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
