//
//  LevelsCell.swift
//  ThaiDai
//
//  Created by Christopher Hicks on 8/12/23.
//

import SwiftUI

struct LevelsCell: View {
    
    let level: WordLevels
    let type: FileKeys
    let toggleAction: (WordLevels) -> Void
    let resetAction: (Int, FileKeys) -> Void
    
    var body: some View {
        VStack {
            HStack(alignment: .bottom, spacing: 24) {
                Text(level.title)
                    .appSectionFont()
                    .onTapGesture { toggleAction(level) }
                  Spacer()
                Text("Reset")
                    .appCellFont(.appPurple, size: .footnote)
                    .onTapGesture { resetAction(level.level, type) }
            }
            .padding(.horizontal)
            Divider()
        }
    }
}

//struct LevelsCell_Previews: PreviewProvider {
//    static var previews: some View {
//        LevelsCell()
//    }
//}
