//
//  BaseViewModel.swift
//  ThaiDai
//
//  Created by Christopher Hicks on 8/11/23.
//

import SwiftUI
import Foundation

class BaseViewModel: ObservableObject {
    
    func save(_ items: [Word], key: FileKeys) {
        if let encoded = try? JSONEncoder().encode(items) {
            UserDefaults.standard.set(encoded, forKey: key.rawValue)
        } else {
            fatalError("Could not encode saving WORD")
        }
    }
    
    func getData(_ key: FileKeys) -> [Word]? {
        if let data = UserDefaults.standard.data(forKey: key.rawValue) {
            let words = try? JSONDecoder().decode([Word].self, from: data)
            return words
        } else {
            return nil
        }
    }
    
    func saveStatus(_ word: Word, key: FileKeys) {
        if let savedWords: [Word] = self.getData(key) {
            var newWords = [word]
            newWords.append(contentsOf: savedWords)
            print("SAVE---> \(newWords)")
            self.save(newWords, key: FileKeys.savedWords)
        } else {
            print("SAVE---> \([word])")
            self.save([word], key: FileKeys.savedWords)
        }
    }
    
    
    func resetAllLessons() {
        UserDefaults.standard.removeObject(forKey: FileKeys.words.rawValue)
        UserDefaults.standard.removeObject(forKey: FileKeys.numbers.rawValue)
        UserDefaults.standard.removeObject(forKey: FileKeys.phrases.rawValue)
    }
    
}

extension BaseViewModel {
    //MARK: RESET HANDLER
    func resetHandler(level: Int, key: FileKeys) -> [Word] {
        let data: [Word] = getData(key) ?? Bundle.main.decode(key)
        var words = data.filter { $0.lesson != level }
        var resetLesson: [Word] = Bundle.main.decode(key)
        resetLesson = resetLesson.filter { $0.lesson == level }
        words.append(contentsOf: resetLesson)
        self.save(words, key: key)
        return words
    }
}
