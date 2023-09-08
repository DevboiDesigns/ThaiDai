//
//  SettingsViewModel.swift
//  ThaiDai
//
//  Created by Christopher Hicks on 8/13/23.
//

import SwiftUI

final class SettingsViewModel: BaseViewModel {
    @Published var savedWords: [Word] = []
    
    
    override init() {
        super.init()
        savedWords = self.getData(.savedWords) ?? []
    }
    
    func setView() {
        savedWords = self.getData(.savedWords) ?? savedWords
    }
    
    func reset(_ level: Int, type: UserKeys) {
        UserDefaults.standard.removeObject(forKey: UserKeys.savedWords.rawValue)
        savedWords = []
    }
    
    func buttonHandler(_ button: CellButtons, _ word: Word) {
        switch button {
        case .edit:
            fallthrough
        case .delete:
            self.delete(word)
        case .save:
            fallthrough
        case .info:
            break
        }
    }
    
    
    private func delete(_ word: Word) {
        
    }
}
