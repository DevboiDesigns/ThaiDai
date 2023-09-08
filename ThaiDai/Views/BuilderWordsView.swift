//
//  BuilderWordsView.swift
//  ThaiDai
//
//  Created by Christopher Hicks on 9/7/23.
//

import SwiftUI

struct BuilderWordsView: View {
    
    @StateObject private var builderVM = BuilderWordsViewModel()
    
    @State private var language: Language = .english
    
    private func lesson(_ lesson: Int, type: BuilderWords) -> [Word] {
        switch type {
        case .adjectives:
            return builderVM.adjectives.filter { $0.lesson == lesson}
        case .pronouns:
            return builderVM.pronouns.filter { $0.lesson == lesson}
        case .verbs:
            return builderVM.verbs.filter { $0.lesson == lesson}
        }
        
    }
    var body: some View {
        VStack {
            HeaderBar(language: $language, title: "Builder Words")
            
            ScrollView(showsIndicators: false) {
                ForEach(BuilderWords.allCases) { type in
                    SectionView(words: lesson(1, type: type),
                                title: type.title, type: type.key,
                                action: builderVM.buttonHandler,
                                resetAction: builderVM.reset)
                }
            }
        }
        .mainBackground()
    }
}

//struct BuilderWords_Previews: PreviewProvider {
//    static var previews: some View {
//        BuilderWords()
//    }
//}
