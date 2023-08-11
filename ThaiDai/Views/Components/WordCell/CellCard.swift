//
//  CellCard.swift
//  ThaiDai
//
//  Created by Christopher Hicks on 8/11/23.
//

import SwiftUI

struct CellCard: View {
    
    let word: Word
    @Binding var language: Language
    
    @State private var backDegree = 0.0
    @State private var frontDegree = -90.0
    @State private var isFlipped = false
    let durationAndDelay : CGFloat = 0.2
    
    var body: some View {
        ZStack {
            CellEnglish(word: word, degree: $backDegree)
            CellThai(word: word, degree: $frontDegree)
        }.onTapGesture {
            flipCard ()
        }
        .onChange(of: language, perform: { _ in
          toggleLanguage()
        })
        .onAppear {
           toggleLanguage()
        }
    }
    
    private func flipCard () {
        isFlipped = !isFlipped
        if isFlipped {
            withAnimation(.linear(duration: durationAndDelay)) {
                backDegree = 90
            }
            withAnimation(.linear(duration: durationAndDelay).delay(durationAndDelay)){
                frontDegree = 0
            }
        } else {
            withAnimation(.linear(duration: durationAndDelay)) {
                frontDegree = -90
            }
            withAnimation(.linear(duration: durationAndDelay).delay(durationAndDelay)){
                backDegree = 0
            }
        }
    }
    
    private func toggleLanguage() {
        if language == .english {
            backDegree = 0.0
            frontDegree = -90.0
        } else {
            backDegree = -90.0
            frontDegree = 0.0
        }
    }
}

//struct CellCard_Previews: PreviewProvider {
//    static var previews: some View {
//        CellCard()
//    }
//}
