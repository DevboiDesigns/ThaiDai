//
//  PhraseLevels.swift
//  ThaiDai
//
//  Created by Christopher Hicks on 9/8/23.
//

import Foundation

enum PhraseLevels: CaseIterable, Identifiable {
    case one, two, three, four
    
    var id: String {
        UUID().uuidString
    }
    
    var title: String {
        "Phrases \(self.level)"
    }
    
    var level: Int {
        switch self {
        case .one:
            return 1
        case .two:
            return 2
        case .three:
            return 3
        case .four:
            return 4
        }
    }
}
