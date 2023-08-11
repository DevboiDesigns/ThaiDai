//
//  NumbersView.swift
//  ThaiDai
//
//  Created by Christopher Hicks on 8/11/23.
//

import SwiftUI

struct NumbersView: View {
    @ObservedObject private var numbersVM = NumbersViewModel()
    var body: some View {
        VStack {
            ScrollView {
                ForEach(numbersVM.numbers) { word in
                    CellCard(word: word)
                }
            }
        }
    }
}

