//
//  WordsView.swift
//  ThaiDai
//
//  Created by Christopher Hicks on 8/11/23.
//

import SwiftUI

struct WordsView: View {
    
    @StateObject private var wordVM = WordsViewModel()
    @State private var language: Language = .english
    @State private var selected: Bool = false
    @State private var level: WordLevels = .one
    
    var body: some View {
        VStack {
            HeaderBar(language: $language, title: "Words")
            
            ScrollView(showsIndicators: false) {
                ZStack {
                    if !selected {
                        VStack {
                            ForEach(WordLevels.allCases) { level in
                                LevelsCell(level: level, type: .words, toggleAction: select, resetAction: wordVM.reset)
                            }
                        }
                    } else {
                        LevelsSectionView(words: wordVM.words.filter { $0.lesson == level.level },
                                          level: level, type: .words,
                                          language: $language,
                                          action: wordVM.buttonHandler,
                                          resetAction: wordVM.reset,
                                          toggleAction: select,
                                          selectable: false)
                    }
                }
            }
        }
        .mainBackground()
        .onAppear {
            //            wordVM.words = wordVM.resetWords()
            //            wordVM.words.shuffle()
            
        }
    }
    
    
    private func select(_ level: WordLevels) {
        withAnimation(.easeIn) {
            print(level)
            self.level = level
            self.selected.toggle()
        }
    }
}



