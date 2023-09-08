//
//  SectionCell.swift
//  ThaiDai
//
//  Created by Christopher Hicks on 8/12/23.
//

import SwiftUI

struct SectionCell: View {
    
    let title: String
    let level: Int
    let type: FileKeys
    @Binding var language: Language
    let toggleAction: () -> Void
    let resetAction: (Int, FileKeys) -> Void
    
    var body: some View {
        VStack {
            HStack(alignment: .center, spacing: 14) {
                Text(title)
                    .appSectionFont()
                    .onTapGesture { toggleAction() }
                Spacer()
                Text("Reset")
                    .appCellFont(.appPurple, size: .footnote)
                    .onTapGesture { resetAction(level, type) }
                    .padding(.trailing)
                LanguageIcon
            }
            .padding(.horizontal)
            Divider()
        }
    }
    
    
    @ViewBuilder
    private var LanguageIcon: some View {
        ZStack {
            if language == .english {
                Image(systemName: "e.circle")
            } else {
                Image(systemName: "t.circle")
            }
        }
        .font(.title2)
        .foregroundColor(.appWhite)
        .onTapGesture {
            if language == .english {
                withAnimation(.easeInOut) { language = .thai }
            } else {
                withAnimation(.easeInOut) { language = .english }
            }
        }
    }
}

//struct Section_Previews: PreviewProvider {
//    static var previews: some View {
//        Section()
//    }
//}
