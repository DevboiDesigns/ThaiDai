//
//  Word.swift
//  ThaiDai
//
//  Created by Christopher Hicks on 8/11/23.
//

import SwiftUI

struct Word: Identifiable, Codable {

    let english: String
    let thai: String
    let lesson: Int
    
    var id: String {
        UUID().uuidString
    }
}
