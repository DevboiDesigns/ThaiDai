//
//  DateLevels.swift
//  ThaiDai
//
//  Created by Christopher Hicks on 9/8/23.
//

import Foundation

enum DateLevels: CaseIterable, Identifiable {
    case one
    
    var id: String {
        UUID().uuidString
    }
    
    var title: String {
        return "Days Of The Week"
    }
    
    var level: Int {
        switch self {
        case .one:
            return 1
        }
        
    }
}
