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
        phrases = setPhrases()
    }

    private func setPhrases() -> [Word] {
        getData(.phrases) ?? Bundle.main.decode("phrases.json")
    }
}
