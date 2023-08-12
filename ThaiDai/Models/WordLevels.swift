//
//  WordLevels.swift
//  ThaiDai
//
//  Created by Christopher Hicks on 8/12/23.
//

import Foundation

enum WordLevels {
    case one, two, three, four
    
    var name: String {
        switch self {
        case .one:
            return "Level 1"
        case .two:
            return "Level 2"
        case .three:
            return "Level 3"
        case .four:
            return "Level 4"
        }
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
