//
//  AppView.swift
//  ThaiDai
//
//  Created by Christopher Hicks on 8/11/23.
//

import SwiftUI

struct AppView: View {
    
    @State private var selection: TabItems = .words
    
    @StateObject private var lessonVM = LessonsViewModel()
    
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
                
                BuilderWordsView()
                    .tabItem {
                        Image(systemName: "bubble.left.and.bubble.right")
                        Text("Builder Words")
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
        .tint(.appPurple)
    }
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        AppView()
//    }
//}








