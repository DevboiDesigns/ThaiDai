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
    let resetAction: () -> Void
    @State private var selected = true
    var body: some View {
        ZStack {
            if selected {
                VStack {
                    HStack(alignment: .bottom, spacing: 14) {
                        Text(title)
                            .appSectionFont()
                            .onTapGesture { toggleView() }
                        Text("Reset")
                            .appCellFont(.appWhite, size: .footnote)
                            .onTapGesture { resetAction() }
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
                    HStack(alignment: .bottom, spacing: 14) {
                        Text(title)
                            .appSectionFont()
                            .onTapGesture { toggleView() }
                        Text("Reset")
                            .appCellFont(.appWhite, size: .footnote)
                            .onTapGesture { resetAction() }
                        Spacer()
                    }
                    .padding(.horizontal)
                    Divider()
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
