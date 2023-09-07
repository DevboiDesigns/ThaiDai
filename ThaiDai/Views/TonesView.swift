//
//  TonesView.swift
//  ThaiDai
//
//  Created by Christopher Hicks on 9/7/23.
//

import SwiftUI

struct TonesView: View {
    
    @StateObject private var tonesVM = TonesViewModel()
    @State private var language: Language = .english
    @State private var selected: Bool = false
    @State private var level: WordLevels = .one
    
    var body: some View {
        VStack {
            HeaderBar(language: $language, title: "Tones & Tenses")
            
            ScrollView {
                SectionView(words: tonesVM.tones,
                            title: "Tones",
                            type: .tones,
                            action: tonesVM.buttonHandler,
                            resetAction: tonesVM.reset)
                
                SectionView(words: tonesVM.tenses,
                            title: "Tenses",
                            type: .tenses,
                            action: tonesVM.buttonHandler,
                            resetAction: tonesVM.reset)
            }
        }
        .mainBackground()
    }
}

