//
//  SectionCell.swift
//  ThaiDai
//
//  Created by Christopher Hicks on 8/12/23.
//

import SwiftUI

struct SectionCell: View {
    
    let title: String
    let toggleAction: () -> Void
    let resetAction: () -> Void
    
    var body: some View {
        VStack {
            HStack(alignment: .bottom, spacing: 14) {
                Text(title)
                    .appSectionFont()
                    .onTapGesture { toggleAction() }
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

//struct Section_Previews: PreviewProvider {
//    static var previews: some View {
//        Section()
//    }
//}
