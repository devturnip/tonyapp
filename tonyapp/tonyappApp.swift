//
//  tonyappApp.swift
//  tonyapp
//
//  Created by Anthony Chua on 30/6/21.
//

import SwiftUI

@main
struct tonyappApp: App {
    let game = EmojitonyappGame()
    //classes are mutable, let only says the game var wont be changed.
    
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: game)
        }
    }
}
