//
//  NumbersView.swift
//  ThaiDai
//
//  Created by Christopher Hicks on 8/11/23.
//

import SwiftUI

struct NumbersView: View {
    @StateObject private var numbersVM = NumbersViewModel()
    @State private var language: Language = .english
    
    private func lesson(_ lesson: Int) -> [Word] {
        numbersVM.numbers.filter { $0.lesson == lesson}
    }
    
    var body: some View {
        VStack {
            HeaderBar(language: $language, title: "Numbers")
            
            ScrollView(showsIndicators: false) {
                SectionView(words: lesson(1),
                            title: "0-9",
                            language: $language,
                            action: numbersVM.buttonHandler,
                            resetAction: numbersVM.reset)
                SectionView(words: lesson(2),
                            title: "10-99",
                            language: $language,
                            action: numbersVM.buttonHandler,
                            resetAction: numbersVM.reset)
                SectionView(words: lesson(3),
                            title: "100-*",
                            language: $language,
                            action: numbersVM.buttonHandler,
                            resetAction: numbersVM.reset)
                SectionView(words: lesson(4),
                            title: "1st-*",
                            language: $language,
                            action: numbersVM.buttonHandler,
                            resetAction: numbersVM.reset)
            }

        }
        .mainBackground()
    }
}

