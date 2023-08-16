//
//  NumbersViewModel.swift
//  ThaiDai
//
//  Created by Christopher Hicks on 8/11/23.
//

import SwiftUI

final class NumbersViewModel: BaseViewModel {
    @Published var numbers: [Word] = []
    private let path = "numbers.json"
    
    override init() {
        super.init()
        numbers = setNumbers()
    }
    
    private func setNumbers() -> [Word] {
        getData(.numbers) ?? Bundle.main.decode(path)
    }
    
    func reset() {
        let newNums: [Word] = Bundle.main.decode(path)
        self.save(newNums, key: UserKeys.numbers)
        self.numbers = newNums
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
        numbers = numbers.filter { $0.id != id }
        self.save(self.numbers, key: UserKeys.numbers)
    }
    
}
