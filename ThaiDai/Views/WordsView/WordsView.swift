//
//  WordsView.swift
//  ThaiDai
//
//  Created by Christopher Hicks on 8/11/23.
//

import SwiftUI

struct WordsView: View {
    @ObservedObject private var wordVM = WordsViewModel()
    var body: some View {
        VStack {
            ScrollView {
                ForEach(wordVM.words) { word in
                    CellCard(word: word)
                }
            }
        }
    }
}
