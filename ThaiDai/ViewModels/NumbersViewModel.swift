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
    
    private let numbersPath = "numbers.json"
    private let daysPath = "daysoftheweek.json"
    
    override init() {
        super.init()
        let (numbers, daysOfWeek) = setNumbers()
        self.numbers = numbers
        self.daysOfTheWeek = daysOfWeek
    }
    
    private func setNumbers() -> ([Word], [Word]) {
        let numbers = getData(.numbers) ?? Bundle.main.decode(numbersPath)
        let daysOfWeek = getData(.daysOfWeek) ?? Bundle.main.decode(daysPath)
        return (numbers, daysOfWeek)
    }
    
    func reset() {
        let newNumbers: [Word] = Bundle.main.decode(numbersPath)
        let newDaysOfWeek: [Word] = Bundle.main.decode(daysPath)
        self.saveAll(numbers: newNumbers, daysOfWeek: newDaysOfWeek)
        self.numbers = newNumbers
        self.daysOfTheWeek = newDaysOfWeek
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
    }
    
}
