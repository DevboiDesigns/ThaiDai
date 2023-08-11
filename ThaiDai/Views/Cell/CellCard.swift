//
//  CellCard.swift
//  ThaiDai
//
//  Created by Christopher Hicks on 8/11/23.
//

import SwiftUI

struct CellCard: View {
    
    let word: Word
    
    @State var backDegree = 0.0
    @State var frontDegree = -90.0
    @State var isFlipped = false
    
    let width : CGFloat = 200
    let height : CGFloat = 250
    let durationAndDelay : CGFloat = 0.2
    
    var body: some View {
        ZStack {
            CellEnglish(word: word, width: width, height: height, degree: $frontDegree)
            CellThai(word: word, width: width, height: height, degree: $backDegree)
        }.onTapGesture {
            flipCard ()
        }
    }
    
    func flipCard () {
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
}

//struct CellCard_Previews: PreviewProvider {
//    static var previews: some View {
//        CellCard()
//    }
//}
