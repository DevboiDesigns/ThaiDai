//
//  BaseViewModel.swift
//  ThaiDai
//
//  Created by Christopher Hicks on 8/11/23.
//

import SwiftUI
import Foundation

class BaseViewModel: ObservableObject {
    
    func save<T: Codable>(_ items: [T], key: UserKeys) {
        if let encoded = try? JSONEncoder().encode(items) {
            UserDefaults.standard.set(encoded, forKey: key.rawValue)
        }
    }
    
    func getData<T: Codable>(_ key: UserKeys) -> [T]? {
        if let data = UserDefaults.standard.data(forKey: key.rawValue) {
            let words = try? JSONDecoder().decode([T].self, from: data)
            return words
        } else {
            return nil
        }
    }
    
    func saveStatus<T: Codable>(_ word: T, key: UserKeys) {
        if let savedWords: [T] = self.getData(key) {
            var newWords = [word]
            newWords.append(contentsOf: savedWords)
            self.save(newWords, key: UserKeys.savedWords)
        } else {
            self.save([word], key: UserKeys.savedWords)
        }
    }
    
    
    func resetAllLessons() {
        UserDefaults.standard.removeObject(forKey: UserKeys.words.rawValue)
        UserDefaults.standard.removeObject(forKey: UserKeys.numbers.rawValue)
        UserDefaults.standard.removeObject(forKey: UserKeys.phrases.rawValue)
    }

}
