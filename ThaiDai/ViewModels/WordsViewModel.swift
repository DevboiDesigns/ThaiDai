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
        words = resetWords()
    }
    
    func resetWords() -> [Word] {
        Bundle.main.decode("lesson.json")
    }
    
    func buttonHandler(_ button: CellButtons, _ word: Word) {
        switch button {
        case .edit:
            print("EDIT Selected......\(word) : ID: \(word.id)")
        case .delete:
            self.delete(word.id)
        case .save:
            print("SAVE Selected......\(word) : ID: \(word.id)")
        case .info:
            print("INFO Selected......\(word) : ID: \(word.id)")
        }
    }
    
    private func delete(_ id: String) {
        words = words.filter { $0.id != id }
    }

}
    
