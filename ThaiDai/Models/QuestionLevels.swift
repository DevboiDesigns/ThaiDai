//
//  QuestionLevels.swift
//  ThaiDai
//
//  Created by Christopher Hicks on 9/8/23.
//

import Foundation

enum QuestionLevels: CaseIterable, Identifiable {
    case one
    
    var id: String {
        UUID().uuidString
    }
    
    var title: String {
        "Questions"
    }
    
    var level: Int {
        switch self {
        case .one:
            return 1
        }
    }
}

