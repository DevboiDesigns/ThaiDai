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
    var body: some View {
        VStack {
            HeaderBar(language: $language, title: "Numbers")
            
            ScrollView(showsIndicators: false) {
                SectionView(words: numbersVM.numbers,
                            title: "0-9",
                            language: $language,
                            action: numbersVM.buttonHandler,
                            resetAction: numbersVM.reset)
                SectionView(words: numbersVM.numbers,
                            title: "10-19",
                            language: $language,
                            action: numbersVM.buttonHandler,
                            resetAction: numbersVM.reset)
                SectionView(words: numbersVM.numbers,
                            title: "20-99",
                            language: $language,
                            action: numbersVM.buttonHandler,
                            resetAction: numbersVM.reset)
                SectionView(words: numbersVM.numbers,
                            title: "100-999",
                            language: $language,
                            action: numbersVM.buttonHandler,
                            resetAction: numbersVM.reset)
                SectionView(words: numbersVM.numbers,
                            title: "1,000-9,999",
                            language: $language,
                            action: numbersVM.buttonHandler,
                            resetAction: numbersVM.reset)
            }

        }
        .mainBackground()
    }
}

