//
//  WordCell.swift
//  ThaiDai
//
//  Created by Christopher Hicks on 8/11/23.
//

import SwiftUI

struct WordCell: View {
    
    let card: Word
    
    @State private var showThai: Bool = false
    
    var body: some View {
        HStack {
            if !showThai {
                withAnimation(.easeInOut) {
                    Text(card.english)
                }
                
            } else {
                withAnimation(.easeInOut) {
                    Text(card.thai)
                }
            }
        }
        .padding()
        .frame(width: rect.width - 20)
        .background(Color.gray)
        .cornerRadius(8)
        .onTapGesture {
            select()
        }
    }
    
    private func select() {
        showThai.toggle()
    }
}

