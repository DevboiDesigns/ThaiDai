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
    
    @State private var showTimeImage = false
    
    private func lesson(_ lesson: Int) -> [Word] {
        numbersVM.numbers.filter { $0.lesson == lesson}
    }
    
    var body: some View {
        VStack {
            HeaderBar(language: $language, title: "Numbers")
            
            ScrollView(showsIndicators: false) {
                ForEach(NumbersLevels.allCases) { level in
                    SectionView(words: lesson(level.level),
                                title: level.title,
                                type: .numbers,
                                action: numbersVM.buttonHandler,
                                resetAction: numbersVM.reset)
                }
                
                ForEach(DateLevels.allCases) { level in
                    SectionView(words: numbersVM.daysOfTheWeek,
                                title: level.title,
                                type: .daysOfWeek,
                                action: numbersVM.buttonHandler,
                                resetAction: numbersVM.reset)
                }
                
                TimeImage(showTimeImage: $showTimeImage)
                
            }
        }
        .mainBackground()
    }
}

