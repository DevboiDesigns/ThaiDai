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
                Spacer()
                Text("Reset")
                    .appCellFont(.appPurple, size: .footnote)
                    .onTapGesture { resetAction() }
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
