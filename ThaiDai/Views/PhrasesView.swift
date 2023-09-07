//
//  PhrasesView.swift
//  ThaiDai
//
//  Created by Christopher Hicks on 8/11/23.
//

import SwiftUI

struct PhrasesView: View {
    @StateObject private var phrasesVM = PhrasesViewModel()
    @State private var language: Language = .english
    
    private func lesson(_ lesson: Int, type: PhraseViewState) -> [Word] {
        switch type {
        case .phrase:
            return phrasesVM.phrases.filter { $0.lesson == lesson }
        case .question:
            return phrasesVM.questions.filter { $0.lesson == lesson }
        }
    }
    
    private func title(_ lesson: Int) -> String {
        "Phrases \(lesson)"
    }
    
    var body: some View {
        VStack {
            HeaderBar(language: $language, title: "Phrases")
            
            ScrollView {
                ForEach(PhraseLevels.allCases) { level in
                    SectionView(words: lesson(level.level, type: .phrase),
                                title: level.title,
                                type: .phrases,
                                action: phrasesVM.buttonHandler,
                                resetAction: phrasesVM.reset)
                }
                
                ForEach(QuestionLevels.allCases) { level in
                    SectionView(words: lesson(level.level, type: .question),
                                title: level.title,
                                type: .questions,
                                action: phrasesVM.buttonHandler,
                                resetAction: phrasesVM.reset)
                }
            }
        }
        .mainBackground()
    }
}

//struct PhrasesView_Previews: PreviewProvider {
//    static var previews: some View {
//        PhrasesView()
//    }
//}
