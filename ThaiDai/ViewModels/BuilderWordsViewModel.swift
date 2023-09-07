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
    
    private let adjectivesPath = "adjectives.json"
    private let pronounsPath = "pronouns.json"
    private let verbsPath = "verbs.json"
    
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
        let adjectives =  getData(.adjectives) ?? Bundle.main.decode(adjectivesPath)
        let pronouns = getData(.pronouns) ?? Bundle.main.decode(pronounsPath)
        let verbs = getData(.verbs) ?? Bundle.main.decode(verbsPath)
        return (adjectives, pronouns, verbs)
    }
    
    func reset(_ level: Int, type: UserKeys) {
        let newAdj: [Word] = Bundle.main.decode(adjectivesPath)
        self.adjectives = newAdj
        let newPron: [Word] = Bundle.main.decode(pronounsPath)
        self.pronouns = newPron
        let newVerbs: [Word] = Bundle.main.decode(verbsPath)
        self.verbs = newVerbs
        self.saveAll(adjectives: newAdj, pronouns: newPron, verbs: newVerbs)
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
