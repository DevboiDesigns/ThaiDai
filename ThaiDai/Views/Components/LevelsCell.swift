//
//  LevelsCell.swift
//  ThaiDai
//
//  Created by Christopher Hicks on 8/12/23.
//

import SwiftUI

struct LevelsCell: View {
    
    let level: WordLevels
    let toggleAction: (WordLevels) -> Void
    let resetAction: () -> Void
    
    var body: some View {
        VStack {
            HStack(alignment: .bottom, spacing: 14) {
                Text(level.name)
                    .appSectionFont()
                    .onTapGesture { toggleAction(level) }
                Text("Reset")
                    .appCellFont(.appWhite, size: .footnote)
                    .onTapGesture { resetAction() }
                Spacer()
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
