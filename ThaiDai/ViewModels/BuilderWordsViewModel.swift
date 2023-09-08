//
//  BuilderWordsViewModel.swift
//  ThaiDai
//
//  Created by Christopher Hicks on 9/7/23.
//

import SwiftUI

final class BuilderWordsViewModel: BaseViewModel {
    
    @Published var adjectives: [Word] = []
    @Published var pronouns: [Word] = []
    @Published var verbs: [Word] = []
    
    override init() {
        super.init()
        setView()
    }
    
    private func setView() {
        let (adjectives, pronouns, verbs) = setBuilderWords()
        print(adjectives)
        self.adjectives = adjectives
        self.pronouns = pronouns
        self.verbs = verbs
    }
    
    private func setBuilderWords() -> ([Word], [Word], [Word]) {
        let adjectives =  getData(.adjectives) ?? Bundle.main.decode(.adjectives)
        let pronouns = getData(.pronouns) ?? Bundle.main.decode(.pronouns)
        let verbs = getData(.verbs) ?? Bundle.main.decode(.verbs)
        return (adjectives, pronouns, verbs)
    }
    
    func reset(_ level: Int, type: UserKeys) {
        switch type {
        case .adjectives:
            self.adjectives = resetHandler(level: level, key: .adjectives)
        case .pronouns:
            self.pronouns = resetHandler(level: level, key: .pronouns)
        case .verbs:
            self.verbs = resetHandler(level: level, key: .verbs)
        default:
            break
        }
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
        let adjectives = adjectives.filter { $0.id != id }
        self.adjectives = adjectives
        let pronouns = pronouns.filter { $0.id != id }
        self.pronouns = pronouns
        let verbs = verbs.filter { $0.id != id }
        self.verbs = verbs
        saveAll(adjectives: adjectives, pronouns: pronouns, verbs: verbs)
    }
    
    private func saveAll(adjectives: [Word], pronouns: [Word], verbs: [Word]) {
        self.save(adjectives, key: .adjectives)
        self.save(pronouns, key: .pronouns)
        self.save(verbs, key: .verbs)
    }
}
