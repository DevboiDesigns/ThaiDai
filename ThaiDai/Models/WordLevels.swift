//
//  WordLevels.swift
//  ThaiDai
//
//  Created by Christopher Hicks on 8/12/23.
//

import Foundation

enum WordLevels {
    case one, two, three, four, five, six, seven, eight, nine, ten, eleven
    
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
        case .five:
            return "Level 5"
        case .six:
            return "Level 6 - Time"
        case .seven:
            return "Level 7 - Time"
        case .eight:
            return "Level 8"
        case .nine:
            return "Level 9"
        case .ten:
            return "Level 10"
        case .eleven:
            return "Level 11"
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
        case .five:
            return 5
        case .six:
            return 6
        case .seven:
            return 7
        case .eight:
            return 8
        case .nine:
            return 9
        case .ten:
            return 10
        case .eleven:
            return 11
        }
    }
}
