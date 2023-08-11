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
    var body: some View {
        Group {
            if selected {
                VStack {
                    Text(title)
                    Divider()
                    ForEach(words) { word in
                        CellCard(word: word)
                    }
                }
            } else {
                VStack {
                    Text(title)
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
