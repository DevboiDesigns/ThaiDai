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
                // Basics
                SectionView(words: wordVM.words, title: "Basics")
                
                // Intermediate
                SectionView(words: wordVM.words, title: "Intermediate")
                
                
                // Advanced
                SectionView(words: wordVM.words, title: "Advanced")
            }
        }
    }
}



