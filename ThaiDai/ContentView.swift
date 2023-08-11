//
//  ContentView.swift
//  ThaiDai
//
//  Created by Christopher Hicks on 8/11/23.
//

import SwiftUI

struct ContentView: View {
    @State private var selection = 0
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
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}




    
   

        
