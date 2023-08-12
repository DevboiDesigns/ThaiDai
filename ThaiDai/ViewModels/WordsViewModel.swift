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
    
    func reset() {
        let newWords: [Word] = Bundle.main.decode("lesson.json")
        self.save(newWords, key: UserKeys.words)
        self.words = newWords
    }
    
    private func setWords() -> [Word] {
        if let data = UserDefaults.standard.data(forKey: UserKeys.words.rawValue) {
            let words = try? JSONDecoder().decode([Word].self, from: data)
            if let words = words {
                return words
            } else {
                return Bundle.main.decode("lesson.json")
            }
        } else {
            return Bundle.main.decode("lesson.json")
        }
    }
    
    func buttonHandler(_ button: CellButtons, _ word: Word) {
        switch button {
        case .edit:
            print("EDIT Selected......\(word) : ID: \(word.id)")
        case .delete:
            self.delete(word.id)
        case .save:
            self.saveStatus(word, key: .words)
        case .info:
            print("INFO Selected......\(word) : ID: \(word.id)")
        }
    }

    private func delete(_ id: String) {
        words = words.filter { $0.id != id }
        self.save(self.words, key: UserKeys.words)
    }
    

}
    
