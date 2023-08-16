//
//  BaseViewModel.swift
//  ThaiDai
//
//  Created by Christopher Hicks on 8/11/23.
//

import SwiftUI
import Foundation

class BaseViewModel: ObservableObject {
    
    func save(_ items: [Word], key: UserKeys) {
        if let encoded = try? JSONEncoder().encode(items) {
            UserDefaults.standard.set(encoded, forKey: key.rawValue)
        } else {
            fatalError("Could not encode saving WORD")
        }
    }
    
    func getData(_ key: UserKeys) -> [Word]? {
        if let data = UserDefaults.standard.data(forKey: key.rawValue) {
            let words = try? JSONDecoder().decode([Word].self, from: data)
            return words
        } else {
            return nil
        }
    }
    
    func saveStatus(_ word: Word, key: UserKeys) {
        if let savedWords: [Word] = self.getData(key) {
            var newWords = [word]
            newWords.append(contentsOf: savedWords)
            print("SAVE---> \(newWords)")
            self.save(newWords, key: UserKeys.savedWords)
        } else {
            print("SAVE---> \([word])")
            self.save([word], key: UserKeys.savedWords)
        }
    }
    
    
    func resetAllLessons() {
        UserDefaults.standard.removeObject(forKey: UserKeys.words.rawValue)
        UserDefaults.standard.removeObject(forKey: UserKeys.numbers.rawValue)
        UserDefaults.standard.removeObject(forKey: UserKeys.phrases.rawValue)
    }

}
