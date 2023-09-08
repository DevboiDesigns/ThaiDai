//
//  Word.swift
//  ThaiDai
//
//  Created by Christopher Hicks on 8/11/23.
//

import SwiftUI

struct Word: Identifiable, Codable {
    let id: String = UUID().uuidString
    let english: String
    let thai: String
    let lesson: Int
}
