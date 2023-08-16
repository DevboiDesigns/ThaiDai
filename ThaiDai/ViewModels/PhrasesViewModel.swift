//
//  PhrasesViewModel.swift
//  ThaiDai
//
//  Created by Christopher Hicks on 8/11/23.
//

import SwiftUI

final class PhrasesViewModel: BaseViewModel {
    @Published var phrases: [Word] = []
    private let path = "phrases.json"
    
    override init() {
        super.init()
        phrases = setPhrases()
    }
    
    func reset() {
        let newPhrases: [Word] = Bundle.main.decode(path)
        self.save(newPhrases, key: UserKeys.phrases)
        self.phrases = newPhrases
    }

    private func setPhrases() -> [Word] {
        getData(.phrases) ?? Bundle.main.decode(path)
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
        phrases = phrases.filter { $0.id != id }
        self.save(self.phrases, key: UserKeys.phrases)
    }
}
