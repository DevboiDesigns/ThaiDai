//
//  AppView.swift
//  ThaiDai
//
//  Created by Christopher Hicks on 8/11/23.
//

import SwiftUI

struct AppView: View {
    @State private var selection = 0
    
    init() {
        UITabBar.appearance().isTranslucent = false
        UITabBar.appearance().backgroundColor = UIColor.black
    }
    
    var body: some View {
        NavigationStack {
            TabView(selection: $selection) {
                WordsView()
                    .tabItem {
                        Image(systemName: "textformat.abc")
                        Text("Words")
                    }
                
                NumbersView()
                    .tabItem {
                        Image(systemName: "list.number")
                        Text("Numbers")
                    }
                
                PhrasesView()
                    .tabItem {
                        Image(systemName: "text.word.spacing")
                        Text("Phrases")
                    }
            }
            .accentColor(.purple)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        AppView()
    }
}








