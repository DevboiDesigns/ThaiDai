//
//  HomeView.swift
//  ThaiDai
//
//  Created by Christopher Hicks on 8/11/23.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject private var listVM = WordListViewModel()
    var body: some View {
        VStack {
            ScrollView {
                ForEach(listVM.words) { word in
                    WordCell(card: word)
                }
            }
        }
    }
}
