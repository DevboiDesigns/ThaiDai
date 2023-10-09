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
    @Published var sentences: [Word] = []
    
    override init() {
        super.init()
        let (phrases, questions, sentences) = setPhrases()
        self.phrases = phrases
        self.questions = questions
        self.sentences = sentences
    }
    
    func reset(_ level: Int, type: FileKeys) {
        switch type {
        case .phrases:
            self.phrases = self.resetHandler(level: level, key: .phrases)
        case .questions:
            self.questions = self.resetHandler(level: level, key: .questions)
        case .sentences:
            self.sentences = self.resetHandler(level: level, key: .sentences)
        default:
            break
        }
    }

    private func setPhrases() -> ([Word], [Word], [Word]) {
        let phrases = getData(.phrases) ?? Bundle.main.decode(.phrases)
        let questions = getData(.questions) ?? Bundle.main.decode(.questions)
        let sentences = getData(.sentences) ?? Bundle.main.decode(.sentences)
        return (phrases, questions, sentences)
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
