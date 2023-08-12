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
    @Binding var language: Language
    let action: (CellButtons, Word) -> Void
    @State private var selected = true
    var body: some View {
        ZStack {
            if selected {
                VStack {
                    HStack {
                        Text(title)
                            .appSectionFont()
                        Spacer()
                    }
                    .padding(.horizontal)
                    
                    Divider()
                    ForEach(words) { word in
                        CellCard(word: word, language: $language)
                            .addSwipeButtons(leadingButtons: [.save], trailingButton: [.delete]) { button in
                                action(button, word)
                            }
                    }
                }
            } else {
                VStack {
                    HStack {
                        Text(title)
                            .appSectionFont()
                        Spacer()
                    }
                    .padding(.horizontal)
                    Divider()
                }
            }
        }
        .onTapGesture {
            withAnimation(.easeInOut) {
                selected.toggle()
            }
        }
    }
}
