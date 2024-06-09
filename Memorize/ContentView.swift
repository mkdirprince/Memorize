//
//  ContentView.swift
//  Memorize
//
//  Created by Prince Wilson on 09/06/2024.
//
//HStack, ZStack, VStack, LazyHGrid or LazyVGrid(columns: [GridItme(.adaptice(minimum: 120))])

import SwiftUI

struct ContentView: View {
    
    let emojis: [String] = ["👻","🍊", "🕷️","🤡", "😈", "🏄🏼‍♀️", "🚗", "✈️", "😱","👻","🍊", "🕷️","🤡", "😈", "🏄🏼‍♀️", "🚗", "✈️", "😱", "👻","🍊", "🕷️","🤡", "😈", "🏄🏼‍♀️", "🚗", "✈️", "😱", "👻","🍊", "🕷️","🤡", "😈", "🏄🏼‍♀️", "🚗", "✈️", "😱"]
    
    @State var cardCount: Int = 4
    
    var body: some View {
        
        VStack {
            ScrollView {
                cards
            }
            Spacer()
            cardCountAdjuster
        }
        .padding()
    }
    
    var cards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 120))]) {
            ForEach(0..<cardCount, id: \.self) {
                index in
                    CardView(content: emojis[index])
                    .aspectRatio(2/3, contentMode: .fit)
            }
            
        }
        .foregroundColor(.orange)
        
    }
    
    var cardCountAdjuster: some View {
        HStack {
            cardRemover
            Spacer()
            cardAdder
          
        }
        .imageScale(.large)
        .font(.largeTitle)
    }
    
    func cardCountAdjuster(by offset: Int, symbol: String) -> some View {
        Button(action: {
            cardCount += offset
        }, label: {
            Image(systemName: symbol)
        })
        .disabled(cardCount + offset < 1 || cardCount + offset > emojis.count)
    }
    
    
    var cardRemover: some View {
        cardCountAdjuster(by: -1, symbol: "rectangle.fill.badge.minus")
    }
  
    
    var cardAdder: some View {
        cardCountAdjuster(by: +1, symbol: "rectangle.fill.badge.plus")
    }
}

struct CardView: View {
    
    var content: String
    
//  temporarily state
    @State var isFaceUp: Bool = true
    
    var body: some View {
        ZStack  {
            let base = RoundedRectangle(cornerRadius: 12)
            
            Group {
                base.fill(.white)
                base.strokeBorder(lineWidth: 2)
                Text(content).font(.largeTitle)
            }.opacity(isFaceUp ? 1 : 0)
               
            base.fill().opacity(isFaceUp ? 0 : 1)
        
        }
        .onTapGesture {
            isFaceUp.toggle()
        }
    }
}






//Notes
//Hstack - crates a horizontal stack of views
//VStack - creates a vertical stack of view
//ZStack - helps put views on top of each other

// Variables can be created within each view as demonstrasted in the above
//conditions must be applied to each struct ve that a zstack or VStack or whatever view there is
//THe var body seems to be a the main struct to create your views



//a way to create a button
// Button("Add Card") {
//cardCount += 1
//}









#Preview {
    ContentView()
}
