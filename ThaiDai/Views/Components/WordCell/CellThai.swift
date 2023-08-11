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
                .appCellFont()
        }
        .cardCellLayer(degree)
    }
}

