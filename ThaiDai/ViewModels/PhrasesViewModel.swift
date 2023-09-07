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
    private let phrasesPath = "phrases.json"
    private let questionsPath = "questions.json"
    
    override init() {
        super.init()
        let (phrases, questions) = setPhrases()
        self.phrases = phrases
        self.questions = questions
    }
    
    func reset() {
        let newPhrases: [Word] = Bundle.main.decode(phrasesPath)
        let newQuestions: [Word] = Bundle.main.decode(questionsPath)
        self.saveAll(phrases: newPhrases, questions: newQuestions)
        self.phrases = newPhrases
        self.questions = newQuestions
    }

    private func setPhrases() -> ([Word], [Word]) {
        let phrases = getData(.phrases) ?? Bundle.main.decode(phrasesPath)
        let questions = getData(.questions) ?? Bundle.main.decode(questionsPath)
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
