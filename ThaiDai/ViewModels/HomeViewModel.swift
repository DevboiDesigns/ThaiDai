//
//  HomeViewModel.swift
//  ThaiDai
//
//  Created by Christopher Hicks on 8/11/23.
//

import SwiftUI


final class HomeViewModel: ObservableObject {
    @Published var words: [Word] = []
    
    init() {
        words = initView()
    }
    
    
    func initView() -> [Word] {
        let mockWords: [Word] = [
            .init(english: "yes", thai: "chai"),
            .init(english: "no", thai: "mai"),
            .init(english: "know", thai: "ruu"),
            .init(english: "teacher", thai: "kru"),
            .init(english: "you", thai: "kun"),
        ]
        
        return mockWords
    }
}
    
