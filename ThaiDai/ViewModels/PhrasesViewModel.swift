//
//  PhrasesViewModel.swift
//  ThaiDai
//
//  Created by Christopher Hicks on 8/11/23.
//

import SwiftUI

final class PhrasesViewModel: BaseViewModel {
    @Published var phrases: [Word] = []
    
    override init() {
        super.init()
        phrases = initView()
    }
    
    func initView() -> [Word] {
        let mockWords: [Word] = [
            .init(english: "What is your name?", thai: "Kun cheu a-rai?"),
            .init(english: "I am very sorry", thai: "Koh tod jing jing"),
            .init(english: "to swim", thai: "wai nam"),
            .init(english: "its ok, doesn't matter", thai: "mai bpen rai"),
        ]
        
        return mockWords
    }
}
