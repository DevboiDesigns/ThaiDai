//
//  CellEnglish.swift
//  ThaiDai
//
//  Created by Christopher Hicks on 8/11/23.
//

import SwiftUI

struct CellEnglish: View {
    
    let word: Word
    let width : CGFloat
    let height : CGFloat
    @Binding var degree : Double
    
    var body: some View {
        HStack {
            Text(word.english)
        }
        .padding()
//        .frame(width: width, height: height)
//        .shadow(color: .gray, radius: 2, x: 0, y: 0)
        .frame(width: rect.width - 20)
        .background(Color.gray)
        .cornerRadius(8)
        .rotation3DEffect(Angle(degrees: degree), axis: (x: 1, y: 0, z: 0))
    }

}

