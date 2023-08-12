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
            .background(Color.appWhite)
            .cornerRadius(8)
            .rotation3DEffect(Angle(degrees: degree), axis: (x: 1, y: 0, z: 0))
    }
    
    func mainBackground() -> some View {
        self
            .background(LinearGradient(colors: [Color.appBlack, Color.appGray], startPoint: .topTrailing, endPoint: .bottomLeading))
    }
    
    func addSwipeButtons(leadingButtons: [CellButtons], trailingButton: [CellButtons], onClick: @escaping (CellButtons) -> Void) -> some View {
        self.modifier(SwipeContainerCell(leadingButtons: leadingButtons, trailingButton: trailingButton, onClick: onClick))
    }
}
