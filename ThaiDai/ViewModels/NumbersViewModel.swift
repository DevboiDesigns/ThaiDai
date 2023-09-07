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
        print(numbers)
        return (numbers, daysOfWeek)
    }
    
    func reset(_ level: Int, type: UserKeys) {
        switch type {
        case .numbers:
            let currentNumbers = getData(.numbers)
            if var currentNumbers = currentNumbers  {
                currentNumbers = currentNumbers.filter { $0.lesson != level }
                var resetLesson: [Word] = Bundle.main.decode(numbersPath)
                resetLesson = resetLesson.filter { $0.lesson == level }
                currentNumbers.append(contentsOf: resetLesson)
                self.numbers = currentNumbers
                self.save(currentNumbers, key: .numbers)
            } else {
                var currentNumbers: [Word] = Bundle.main.decode(numbersPath) ?? []
                currentNumbers = currentNumbers.filter { $0.lesson != level }
                var resetLesson: [Word] = Bundle.main.decode(numbersPath)
                resetLesson = resetLesson.filter { $0.lesson == level }
                currentNumbers.append(contentsOf: resetLesson)
                self.numbers = currentNumbers
                self.save(currentNumbers, key: .numbers)
            }
            
        case .daysOfWeek:
            let newDaysOfWeek = getData(.daysOfWeek)
            if var newDaysOfWeek = newDaysOfWeek {
                newDaysOfWeek = newDaysOfWeek.filter { $0.lesson != level }
                var resetLesson: [Word] = Bundle.main.decode(daysPath)
                resetLesson = resetLesson.filter { $0.lesson == level }
                newDaysOfWeek.append(contentsOf: resetLesson)
                self.daysOfTheWeek = newDaysOfWeek
                self.save(newDaysOfWeek, key: .daysOfWeek)
                
            } else {
                var newDaysOfWeek: [Word] = Bundle.main.decode(daysPath)
                newDaysOfWeek = newDaysOfWeek.filter { $0.lesson != level }
                var resetLesson: [Word] = Bundle.main.decode(daysPath)
                resetLesson = resetLesson.filter { $0.lesson == level }
                newDaysOfWeek.append(contentsOf: resetLesson)
                self.daysOfTheWeek = newDaysOfWeek
                self.save(newDaysOfWeek, key: .daysOfWeek)
            }
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
