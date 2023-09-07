//
//  WordsViewModel.swift
//  ThaiDai
//
//  Created by Christopher Hicks on 8/11/23.
//

import SwiftUI



final class WordsViewModel: BaseViewModel {
    @Published var words: [Word] = []
    private let path = "words.json"
    
    override init() {
        super.init()
        words = setWords()
    }
    
    private func setWords() -> [Word] {
        getData(.words) ?? Bundle.main.decode(path)
    }
    
    func buttonHandler(_ button: CellButtons, _ word: Word) {
        switch button {
        case .edit:
            print("EDIT Selected......\(word) : ID: \(word.id)")
        case .delete:
            self.delete(word.id)
        case .save:
            self.saveStatus(word, key: .savedWords)
        case .info:
            print("INFO Selected......\(word) : ID: \(word.id)")
        }
    }

    private func delete(_ id: String) {
        words = words.filter { $0.id != id }
        self.save(self.words, key: UserKeys.words)
    }

    func reset(_ level: Int) {
        var allWords: [Word] = []
        var newWords: [Word] = Bundle.main.decode(path)
        newWords = newWords.filter { $0.lesson == level }
        let oldWords = self.getData(.words)
        if var oldWords = oldWords {
            oldWords = oldWords.filter { $0.lesson != level }
            allWords.append(contentsOf: oldWords)
            allWords.append(contentsOf: newWords)
        } else {
            var oldWords: [Word] = Bundle.main.decode(path)
            oldWords = oldWords.filter { $0.lesson != level }
            allWords.append(contentsOf: oldWords)
            allWords.append(contentsOf: newWords)
        }
        self.save(allWords, key: UserKeys.words)
        self.words = allWords
    }

}
    
