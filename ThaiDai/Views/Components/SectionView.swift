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
    let type: FileKeys
    @State var language: Language = .english
    let action: (CellButtons, Word) -> Void
    let resetAction: (Int, FileKeys) -> Void
    var selectable: Bool = true
    @State var selected = false
    
    var level: Int {
        print(words.first)
        return words.first?.lesson ?? 99
    }
    var body: some View {
        ZStack {
            if selected {
                VStack {
                    SectionCell(title: title, level: level, type: type, language: $language, toggleAction: toggleView, resetAction: resetAction)
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
                    SectionCell(title: title, level: level, type: type, language: $language, toggleAction: toggleView, resetAction: resetAction)
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
