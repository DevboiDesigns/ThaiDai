//
//  PhrasesViewModel.swift
//  ThaiDai
//
//  Created by Christopher Hicks on 8/11/23.
//

import SwiftUI

final class PhrasesViewModel: BaseViewModel {
    
    @Published var phrases: [Word] = []
    @Published var questions: [Word] = []
    
    override init() {
        super.init()
        let (phrases, questions) = setPhrases()
        self.phrases = phrases
        self.questions = questions
    }
    
    func reset(_ level: Int, type: FileKeys) {
        switch type {
        case .phrases:
            self.phrases = self.resetHandler(level: level, key: .phrases)
        case .questions:
            self.questions = self.resetHandler(level: level, key: .questions)
        default:
            break
        }
    }

    private func setPhrases() -> ([Word], [Word]) {
        let phrases = getData(.phrases) ?? Bundle.main.decode(.phrases)
        let questions = getData(.questions) ?? Bundle.main.decode(.questions)
        return (phrases, questions)
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
        questions = questions.filter { $0.id != id }
        self.saveAll(phrases: phrases, questions: questions)
    }
    
    private func saveAll(phrases: [Word], questions: [Word]) {
        self.save(phrases, key: .phrases)
        self.save(questions, key: .questions)
    }
}
