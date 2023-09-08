//
//  NumbersViewModel.swift
//  ThaiDai
//
//  Created by Christopher Hicks on 8/11/23.
//

import SwiftUI

final class NumbersViewModel: BaseViewModel {
    
    @Published var numbers: [Word] = []
    @Published var daysOfTheWeek: [Word] = []
    
    override init() {
        super.init()
        let (numbers, daysOfWeek) = setNumbers()
        self.numbers = numbers
        self.daysOfTheWeek = daysOfWeek
    }
    
    private func setNumbers() -> ([Word], [Word]) {
        let numbers = getData(.numbers) ?? Bundle.main.decode(.numbers)
        let daysOfWeek = getData(.daysOfWeek) ?? Bundle.main.decode(.daysOfWeek)
        print(numbers)
        return (numbers, daysOfWeek)
    }
    
    func reset(_ level: Int, type: FileKeys) {
        switch type {
        case .numbers:
            self.numbers = self.resetHandler(level: level, key: .numbers)
        case .daysOfWeek:
            self.daysOfTheWeek = self.resetHandler(level: level, key: .daysOfWeek)
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
        numbers = numbers.filter { $0.id != id }
        daysOfTheWeek = daysOfTheWeek.filter { $0.id != id }
        self.saveAll(numbers: numbers, daysOfWeek: daysOfTheWeek)
    }
    
    private func saveAll(numbers: [Word], daysOfWeek: [Word]) {
        self.save(numbers, key: .numbers)
        self.save(daysOfWeek, key: .daysOfWeek)
        self.numbers = numbers
        self.daysOfTheWeek = daysOfWeek
    }
    
}
