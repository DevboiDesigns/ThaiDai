//
//  TimeImage.swift
//  ThaiDai
//
//  Created by Christopher Hicks on 9/8/23.
//

import SwiftUI

struct TimeImage: View {
    
    @Binding var showTimeImage: Bool
    
    var body: some View {
        ZStack {
            if !showTimeImage {
                ImageHeader
            } else {
                VStack {
                    ImageHeader
                    HStack {
                        Spacer()
                        Text("Courtesy of Oleg Radchenko")
                            .font(.caption)
                            .foregroundColor(.white)
                            .opacity(0.5)
                    }
                    Image("thai_time")
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: .infinity)
                    
                }
            }
            
        }
        .padding(.horizontal)
    }
    
    private var ImageHeader: some View {
        HStack {
            Text("Time")
                .appSectionFont()
                .onTapGesture {
                    withAnimation(.easeInOut) {
                        self.showTimeImage.toggle()
                    }
                }
            Spacer()
        }
    }
}

