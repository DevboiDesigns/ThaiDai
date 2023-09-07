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
                TonesView()
                    .tabItem {
                        Text("Tones")
                    }
                    .tag(0)
                WordsView()
                    .tabItem {
                        Image(systemName: "textformat.abc")
                        Text("Words")
                    }
                    .tag(1)
                
                BuilderWordsView()
                    .tabItem {
                        Image(systemName: "bubble.left.and.bubble.right")
                        Text("Builder Words")
                    }
                    .tag(2)
                
                NumbersView()
                    .tabItem {
                        Image(systemName: "list.number")
                        Text("Numbers")
                    }
                    .tag(3)
                
                PhrasesView()
                    .tabItem {
                        Image(systemName: "text.word.spacing")
                        Text("Phrases")
                    }
                    .tag(4)
            }
        }
        .tint(.appWhite)
    }
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        AppView()
//    }
//}








