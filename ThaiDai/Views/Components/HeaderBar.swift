//
//  HeaderBar.swift
//  ThaiDai
//
//  Created by Christopher Hicks on 8/11/23.
//

import SwiftUI

struct HeaderBar: View {
    @Binding var language: Language
    let title: String
    var body: some View {
        HStack(alignment: .bottom) {
            Text(title)
                .appTitleFont()
            Spacer()
            
            LanguageIcon
        }
        .padding(.horizontal)
    }
    
    @ViewBuilder
    private var LanguageIcon: some View {
        ZStack {
            if language == .english {
                Image(systemName: "e.circle")
                    .resizable()
                    .scaledToFit()
            } else {
                Image(systemName: "t.circle")
                    .resizable()
                    .scaledToFit()
            }
        }
        .frame(width: 26)
        .foregroundColor(.white)
        .onTapGesture {
            if language == .english {
                withAnimation(.easeInOut) { language = .thai }
            } else {
                withAnimation(.easeInOut) { language = .english }
            }
        }
    }
}
