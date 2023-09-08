//
//  UserKeys.swift
//  ThaiDai
//
//  Created by Christopher Hicks on 8/12/23.
//

import SwiftUI

enum FileKeys: String, CaseIterable {
    case words = "co.thaidai.words"
    case numbers = "co.thaidai.numbers"
    case phrases = "co.thaidai.phrases"
    case adjectives = "co.thaidai.adjectives"
    case pronouns = "co.thaidai.pronouns"
    case verbs = "co.thaidai.verbs"
    case questions = "co.thaidai.questions"
    case daysOfWeek = "co.thaidai.daysOfTheWeek"
    case tones = "co.thaidai.tones"
    case tenses = "co.thaidai.tenses"
    
    case savedWords = "co.thaidai.savedWords"
    
    
    var fileName: String {
        switch self {
        case .words:
            return "\(self).json"
        case .numbers:
            return "\(self).json"
        case .phrases:
            return "\(self).json"
        case .adjectives:
            return "\(self).json"
        case .pronouns:
            return "\(self).json"
        case .verbs:
            return "\(self).json"
        case .questions:
            return "\(self).json"
        case .daysOfWeek:
            return "daysoftheweek.json"
        case .savedWords:
            return "\(self).json"
        case .tones:
            return "\(self).json"
        case .tenses:
            return "\(self).json"
        }
    }
}
