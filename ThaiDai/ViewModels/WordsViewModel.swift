//
//  WordsViewModel.swift
//  ThaiDai
//
//  Created by Christopher Hicks on 8/11/23.
//

import SwiftUI



final class WordsViewModel: BaseViewModel {
    @Published var words: [Word] = []
    
    override init() {
        super.init()
        words = setWords()
    }
    
    private func setWords() -> [Word] {
        getData(.words) ?? Bundle.main.decode(.words)
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

    func reset(_ level: Int, type: UserKeys) {
        self.words = self.resetHandler(level: level, key: .words)
    }

}
    
