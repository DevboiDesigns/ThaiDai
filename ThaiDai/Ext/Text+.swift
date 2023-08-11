//
//  Text+.swift
//  ThaiDai
//
//  Created by Christopher Hicks on 8/11/23.
//

import SwiftUI

extension Text {
    func appSectionFont() -> some View {
        self
            .font(.headline)
            .foregroundColor(.white)
    }
    
    func appTitleFont() -> some View {
        self
            .font(.title3)
            .foregroundColor(.purple)
    }
    
    func appCellFont() -> some View {
        self
            .font(.body)
            .foregroundColor(.black)
    }
}
