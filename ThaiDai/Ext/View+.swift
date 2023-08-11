//
//  View+.swift
//  ThaiDai
//
//  Created by Christopher Hicks on 8/11/23.
//

import SwiftUI

extension View {
    var rect: CGRect {
        UIScreen.main.bounds
    }
    
    func cardCellLayer(_ degree: Double) -> some View {
        self
            .padding()
            .frame(width: rect.width - 20)
            .background(Color.gray)
            .cornerRadius(8)
            .rotation3DEffect(Angle(degrees: degree), axis: (x: 1, y: 0, z: 0))
    }
}
