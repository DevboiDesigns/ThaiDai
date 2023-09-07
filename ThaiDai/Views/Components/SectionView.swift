//
//  SectionView.swift
//  ThaiDai
//
//  Created by Christopher Hicks on 8/11/23.
//

import SwiftUI

struct SectionView: View {
    let words: [Word]
    let title: String
    @State var language: Language = .english
    let action: (CellButtons, Word) -> Void
    let resetAction: (Int) -> Void
    var selectable: Bool = true
    @State var selected = false
    
    var level: Int {
        words.first?.lesson ?? 1
    }
    var body: some View {
        ZStack {
            if selected {
                VStack {
                    SectionCell(title: title, level: level, language: $language, toggleAction: toggleView, resetAction: resetAction)
                    ForEach(words) { word in
                        if selectable {
                            CellCard(word: word, language: $language)
                                .addSwipeButtons(leadingButtons: [.save], trailingButton: [.delete]) { button in
                                    action(button, word)
                                }
                        } else {
                            CellCard(word: word, language: $language)
                        }
                    }
                }
            } else {
                VStack {
                    SectionCell(title: title, level: level, language: $language, toggleAction: toggleView, resetAction: resetAction)
                }
            }
        }
    }
    
    private func toggleView() {
        withAnimation(.easeInOut) {
            selected.toggle()
        }
    }
}
