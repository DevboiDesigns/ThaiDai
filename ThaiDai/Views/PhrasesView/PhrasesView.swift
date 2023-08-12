//
//  PhrasesView.swift
//  ThaiDai
//
//  Created by Christopher Hicks on 8/11/23.
//

import SwiftUI

struct PhrasesView: View {
    @ObservedObject private var phrasesVM = PhrasesViewModel()
    @State private var language: Language = .english
    var body: some View {
        VStack {
            HeaderBar(language: $language, title: "Phrases")
            
            ScrollView {
                ForEach(phrasesVM.phrases) { word in
                    CellCard(word: word, language: $language)
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
