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
    @State private var selected = true
    @Binding var language: Language
    var body: some View {
        Group {
            if selected {
                VStack {
                    Text(title)
                        .appSectionFont()
                    Divider()
                    ForEach(words) { word in
                        CellCard(word: word, language: $language)
                    }
                }
            } else {
                VStack {
                    Text(title)
                        .appSectionFont()
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
