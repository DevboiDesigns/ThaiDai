//
//  TonesViewModel.swift
//  ThaiDai
//
//  Created by Christopher Hicks on 9/7/23.
//

import SwiftUI

final class TonesViewModel: BaseViewModel {
    
    @Published var tones: [Word] = []
    @Published var tenses: [Word] = []
    
    private let tonesPath = UserKeys.tones.fileName
    private let tensesPath = UserKeys.tenses.fileName
    
    override init() {
        super.init()
        let (tones, tenses) = setWords()
        self.tones = tones
        self.tenses = tenses
    }
    
    private func setWords() -> ([Word], [Word]) {
        let tones: [Word] = getData(.tones) ?? Bundle.main.decode(.tones)
        let tenses: [Word] = getData(.tenses) ?? Bundle.main.decode(.tenses)
        return (tones, tenses)
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
        tones = tones.filter { $0.id != id }
        tenses = tenses.filter { $0.id != id }
        self.saveAll(tones: tones, tenses: tenses)
    }
    
    private func saveAll(tones: [Word], tenses: [Word]) {
        self.save(tones, key: .tones)
        self.save(tenses, key: .tenses)
    }
    
    func reset(_ level: Int, type: UserKeys) {
        switch type {
        case .tones:
            self.tones = resetHandler(level: level, path: tonesPath, key: .tones)
        case .tenses:
            self.tenses = resetHandler(level: level, path: tensesPath, key: .tenses)
        default:
            break
        }
    }
    
}
