//
//  ContentView.swift
//  Memorize
//
//  Created by Prince Wilson on 09/06/2024.
//
//HStack, ZStack, VStack

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack {
            CardView(isFaceUp: true)
            CardView(isFaceUp: true)
            CardView()
            CardView()
        }
        .foregroundColor(.orange)
        .padding()
    }
}

struct CardView: View {
//  temporarily state
    @State var isFaceUp: Bool = false
    
    var body: some View {
        ZStack  {
            let base = RoundedRectangle(cornerRadius: 12)
            
            if isFaceUp {
                base.fill(.white)
                base
                    .strokeBorder(lineWidth: 2)
                Text("👻").font(.largeTitle)
            }
            else {
                base.fill()
            }
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














#Preview {
    ContentView()
}
