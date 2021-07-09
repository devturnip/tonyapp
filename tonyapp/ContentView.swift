//
//  ContentView.swift
//  tonyapp
//
//  Created by Anthony Chua on 30/6/21.
//

import SwiftUI

struct ContentView: View {
    @State var emojis = ["🚚", "🚀", "⛽️", "🚆", "🚲", "🛸", "🛶", "🚁", "🏎", "🚓", "🚌", "🚜", "🚇", "🗿", "🏨"]
    @State var emojiCount = 15
    var body: some View {
        VStack {
            title
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 100))]) {
                    ForEach(emojis[0..<emojiCount], id: \.self) { emoji in
                        Cardview(content: emoji)
                            .aspectRatio(2/3, contentMode: .fit)
                    }
                }
            }
            .foregroundColor(/*@START_MENU_TOKEN@*/.red/*@END_MENU_TOKEN@*/) //colors are passed down, unless overwritten in internal views
            Spacer()
            HStack {
                t1
                Spacer()
                t2
                Spacer()
                t3
                
            }
            .font(.largeTitle)
            .padding(.horizontal)
        }
        .padding(.horizontal) //padding on stack itself
    }
    
    var title: some View {
        Text("Memorize")
            .font(.largeTitle)
            
            
    }
     
    var remove: some View {
        Button{
            if emojiCount > 1 {
                emojiCount -= 1
            }
        } label: {
            Image(systemName: "minus.circle")
        }
    }
    
    var add: some View {
        Button{
            if emojiCount < emojis.count {
                emojiCount += 1
            }
        } label: {
           Image(systemName: "plus.circle")
        }
    }
    
    var t1: some View {
        Button{
            let vehicles = ["🚗", "🚙", "🏎", "🚕", "🚓", "🚘", "🚖","🚔"]
            emojis = vehicles.shuffled()
            emojiCount = vehicles.count
        } label: {
            VStack {
               Image(systemName: "car")
                Text("Vehicles")
                    .font(.body)
            }
        }
    }
    
    var t2: some View {
        Button{
            let person = ["🤦‍♀️", "🤦", "🤦‍♂️", "🤷‍♀️", "🤷", "🤷‍♂️", "💃", "🕺"]
            emojis = person.shuffled()
            emojiCount = person.count
        } label: {
            VStack {
               Image(systemName: "person")
                Text("People")
                    .font(.body)
            }
        }
    }
    
    var t3: some View {
        Button{
            let plant = ["🌹", "💐", "🌸", "🎄", "🌺", "🍀", "🌷", "🌻"]
            emojis = plant.shuffled()
            emojiCount = plant.count
        } label: {
            VStack {
               Image(systemName: "leaf")
                Text("Plants")
                    .font(.body)
            }
        }
    }
}

struct Cardview: View {
    var content: String
    @State var isFaceUp : Bool = true
    
    var body: some View {
        //zstack - view combiners
        //no need to specify args in this case
        //if the args are functions
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 20)
            if isFaceUp {
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: 3)
                Text(content)
                    .font(.largeTitle)
            } else {
                shape.fill()
            }
        }
        .onTapGesture {
            isFaceUp = !isFaceUp
            //@state allows bool in immutable views to be modified
            //
        }
    }
}









struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        //modify contentview for example dark mdoe
        ContentView()
            .preferredColorScheme(.dark)
        ContentView()
    }
}
