//
//  NumbersLevels.swift
//  ThaiDai
//
//  Created by Christopher Hicks on 9/8/23.
//

import Foundation

enum NumbersLevels: CaseIterable, Identifiable {
    case one, two, three, four
    
    var id: String {
        UUID().uuidString
    }
    
    var title: String {
        switch self {
        case .one:
            return "0-9"
        case .two:
            return "10-99"
        case .three:
            return "100-*"
        case .four:
            return "1st-*"
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
