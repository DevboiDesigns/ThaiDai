//
//  PhrasesView.swift
//  ThaiDai
//
//  Created by Christopher Hicks on 8/11/23.
//

import SwiftUI

struct PhrasesView: View {
    @ObservedObject private var phrasesVM = PhrasesViewModel()
    var body: some View {
        VStack {
            ScrollView {
                ForEach(phrasesVM.phrases) { word in
                    CellCard(word: word)
                }
            }
        }
    }
}

struct PhrasesView_Previews: PreviewProvider {
    static var previews: some View {
        PhrasesView()
    }
}
