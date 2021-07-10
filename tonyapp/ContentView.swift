//
//  ContentView.swift
//  tonyapp
//  this is the view
//  Created by Anthony Chua on 30/6/21.
//

import SwiftUI

struct ContentView: View {
    //keyword tells view to redraw when model changed
    @ObservedObject var viewModel: EmojitonyappGame

    var body: some View {
        ScrollView {
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 100))]) {
                ForEach(viewModel.cards) { card in
                    Cardview(card: card)
                        .aspectRatio(2/3, contentMode: .fit)
                        .onTapGesture {
                            viewModel.choose(card)
                        }
                }
            }
        }
        .foregroundColor(/*@START_MENU_TOKEN@*/.red/*@END_MENU_TOKEN@*/) //colors are passed down, unless overwritten in internal views
        .font(.largeTitle)
        .padding(.horizontal)
    }
}

struct Cardview: View {
    let card: tonyappGame<String>.Card
    
    var body: some View {
        //zstack - view combiners
        //no need to specify args in this case
        //if the args are functions
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 20)
            if card.isFaceUp {
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: 3)
                Text(card.content)
                    .font(.largeTitle)
            } else {
                shape.fill()
            }
        }
    }
}









struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojitonyappGame()
        //modify contentview for example dark mdoe
        ContentView(viewModel: game)
            .preferredColorScheme(.dark)
        ContentView(viewModel: game)
            .preferredColorScheme(.light)
    }
}
