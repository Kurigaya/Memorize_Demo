//
//  ContentView.swift
//  Memorize Demo
//
//  Created by Mac-Peerapat on 10/10/2566 BE.
//

import SwiftUI

// like a class >> empathize to fn
// most will be 1 obj. in 1 struct
struct ContentView: View { // View is interface or protocol
    var age: Int = 32 // Stored variable
    let PI = 3.141
    let emojis = ["👻", "🎃", "🕷️", "👹", "💀", "🕸️", "🧙", "🙀", "👿", "😱", "☠️", "🍭"] + ["👻", "🎃", "🕷️", "👹", "💀", "🕸️", "🧙", "🙀", "👿", "😱", "☠️", "🍭"]
    @State var cardCount = 9
    
    var body: some View { // Computed variable // Realtime render
        VStack{
            ScrollView{
                cards
            }
            cardAdjuster
        }
        .padding()
    }
    
    var cards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 120))]){
            //emojis.indicies == 0..<emojis.count
            ForEach(0..<cardCount, id: \.self){ index in //give index as paramiter into loop
                CardView(content: emojis[index])
                    .aspectRatio(2/3, contentMode: .fit)
            }
            //            CardView(content: emojis[0], isFaceUp: true)
            //            CardView(content: emojis[1])
            //            CardView(content: emojis[2])
            //            CardView(content: emojis[3])
        }
        .foregroundColor(.purple) //card color
    }
    
    func cardCountAdjuster(by offset: Int, symbol: String) -> some View{
        Button(action: {
            cardCount += offset
        } ){
            Image(systemName: symbol)
        }
        .disabled(cardCount + offset < 1 || cardCount + offset > emojis.count)
    }
    
    var cardRemover:some View {
        cardCountAdjuster(by: -1, symbol:"rectangle.stack.badge.minus")
//        Button(action: {
//            if cardCount > 1{
//                cardCount -= 1
//            }
//        }, label:{
//            Image(systemName: "rectangle.stack.badge.minus")
//        })
        
    }
    
    var cardAdder: some View {
        cardCountAdjuster(by: 1, symbol: "rectangle.stack.fill.badge.plus")
//        Button(action: {
//            if cardCount < emojis.count{
//                cardCount += 1
//            }
//        } ){
//            Image(systemName: "rectangle.stack.fill.badge.plus")
//        }
    }
    
    var cardAdjuster: some View {
        HStack{
            cardRemover
            Spacer()
            cardAdder
        }
//        .foregroundColor(.green) // all button color
        .imageScale(.large)
        .font(.largeTitle)
    }
}

struct CardView: View{
    let content: String
    @State var isFaceUp: Bool = false //Changable var //Not change default var
    
    var body: some View{
        ZStack{
            let base = RoundedRectangle(cornerRadius: 12)
            Group {
                base.foregroundColor(.white)
                base.strokeBorder(lineWidth: 2)
                Text(content).font(.largeTitle)
            }.opacity(isFaceUp ? 1 : 0)
            base.opacity(isFaceUp ? 0 : 1)
            
        }
        .onTapGesture {
            isFaceUp.toggle()
        }
       
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
