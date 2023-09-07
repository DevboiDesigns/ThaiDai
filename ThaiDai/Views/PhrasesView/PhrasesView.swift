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
    
    private func lesson(_ lesson: Int, type: PhraseType) -> [Word] {
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
                SectionView(words: lesson(1, type: .phrase),
                            title: title(1), type: .phrases,
                            action: phrasesVM.buttonHandler,
                            resetAction: phrasesVM.reset)
                SectionView(words: lesson(2, type: .phrase),
                            title: title(2), type: .phrases,
                            action: phrasesVM.buttonHandler,
                            resetAction: phrasesVM.reset)
                SectionView(words: lesson(3, type: .phrase),
                            title: title(3), type: .phrases,
                            action: phrasesVM.buttonHandler,
                            resetAction: phrasesVM.reset)
                SectionView(words: lesson(4, type: .phrase),
                            title: title(4), type: .phrases,
                            action: phrasesVM.buttonHandler,
                            resetAction: phrasesVM.reset)
                
                SectionView(words: lesson(1, type: .question),
                            title: "Questions", type: .questions,
                            action: phrasesVM.buttonHandler,
                            resetAction: phrasesVM.reset)
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
