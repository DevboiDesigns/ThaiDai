//
//  LevelsSectionView.swift
//  ThaiDai
//
//  Created by Christopher Hicks on 8/11/23.
//

import SwiftUI

struct LevelsSectionView: View {
    let words: [Word]
    let level: WordLevels
    @Binding var language: Language
    let action: (CellButtons, Word) -> Void
    let resetAction: (Int) -> Void
    let toggleAction: (WordLevels) -> Void
    var selectable: Bool = true
    @State private var selected = true
    var body: some View {
        ZStack {
            if selected {
                VStack {
                    LevelsCell(level: level, toggleAction: toggleAction, resetAction: resetAction)
   
                    ForEach(words) { word in
                        CellCard(word: word, language: $language)
                            .addSwipeButtons(leadingButtons: [.save], trailingButton: [.delete]) { button in
                                action(button, word)
                            }
                    }
                }
            } else {
                VStack {
                    LevelsCell(level: level, toggleAction: toggleAction, resetAction: resetAction)
                }
            }
        }
    }
    
//    private func toggleView(_ level: WordLevels) {
//        if selectable {
//            withAnimation(.easeInOut) {
//                selected.toggle()
//            }
//        }
//    }
}
