//
//  SearchViewModel.swift
//  ThaiDai
//
//  Created by Christopher Hicks on 9/7/23.
//

import SwiftUI

final class SearchViewModel: BaseViewModel {
    
    @Published var queredWords: [Word] = []
    
    override init() {
        super.init()
        queredWords = getAllWords()
    }
    
    private func getAllWords() -> [Word] {
        var allWords: [Word] = []
        UserKeys.allCases.forEach { wordType in
            if wordType != .savedWords {
                let words: [Word] = Bundle.main.decode(wordType)
                allWords.append(contentsOf: words)
            }
        }

        return allWords
    }
}
