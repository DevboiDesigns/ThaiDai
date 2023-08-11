//
//  NumbersViewModel.swift
//  ThaiDai
//
//  Created by Christopher Hicks on 8/11/23.
//

import SwiftUI

final class NumbersViewModel: BaseViewModel {
    @Published var numbers: [Word] = []
    
    override init() {
        super.init()
        numbers = initView()
    }
    
    
    func initView() -> [Word] {
        let mockWords: [Word] = [
            .init(english: "0", thai: "suun"),
            .init(english: "1", thai: "neung"),
            .init(english: "2", thai: "song"),
            .init(english: "3", thai: "saam"),
            .init(english: "4", thai: "sii"),
            .init(english: "5", thai: "haa"),
            .init(english: "6", thai: "hoag"),
            .init(english: "7", thai: "jed"),
            .init(english: "8", thai: "bpaad"),
            .init(english: "9", thai: "gao"),
        ]
        
        return mockWords
    }
}
