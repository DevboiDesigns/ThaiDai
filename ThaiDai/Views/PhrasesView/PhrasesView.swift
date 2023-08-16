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
    
    private func lesson(_ lesson: Int) -> [Word] {
        phrasesVM.phrases.filter { $0.lesson == lesson}
    }
    
    var body: some View {
        VStack {
            HeaderBar(language: $language, title: "Phrases")
            
            ScrollView {
                SectionView(words: lesson(1), title: "Level 1", language: $language,
                            action: phrasesVM.buttonHandler,
                            resetAction: phrasesVM.reset)
                SectionView(words: lesson(2), title: "Level 2", language: $language,
                            action: phrasesVM.buttonHandler,
                            resetAction: phrasesVM.reset)
                SectionView(words: lesson(3), title: "Level 3", language: $language,
                            action: phrasesVM.buttonHandler,
                            resetAction: phrasesVM.reset)
                SectionView(words: lesson(4), title: "Level 4", language: $language,
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
