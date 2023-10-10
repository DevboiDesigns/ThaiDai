//
//  LessonsResponse.swift
//  ThaiDai
//
//  Created by Christopher Hicks on 10/11/23.
//

import Foundation

struct LessonsResponse: Codable {
    let response: [LessonData]
}


struct LessonData: Codable {
    let id: String
    let lessons: [Word]
}
