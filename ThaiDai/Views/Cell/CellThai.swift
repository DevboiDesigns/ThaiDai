//
//  CellThai.swift
//  ThaiDai
//
//  Created by Christopher Hicks on 8/11/23.
//

import SwiftUI

struct CellThai: View {
    
    let word: Word
    @Binding var degree : Double
    
    var body: some View {
        HStack {
            Text(word.thai)
        }
        .padding()
        .frame(width: rect.width - 20)
        .background(Color.gray)
        .cornerRadius(8)
        .rotation3DEffect(Angle(degrees: degree), axis: (x: 1, y: 0, z: 0))
    }
    
}

