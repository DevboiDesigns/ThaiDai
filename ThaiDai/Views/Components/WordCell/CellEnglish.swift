//
//  CellEnglish.swift
//  ThaiDai
//
//  Created by Christopher Hicks on 8/11/23.
//

import SwiftUI

struct CellEnglish: View {
    
    let word: Word
    @Binding var degree : Double
    
    var body: some View {
        HStack {
            Text(word.english)
                .appCellFont()
        }
        .cardCellLayer(degree)
    }
}

