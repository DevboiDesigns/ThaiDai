//
//  SettingsView.swift
//  ThaiDai
//
//  Created by Christopher Hicks on 8/12/23.
//

import SwiftUI

struct SettingsView: View {
    @StateObject var settingsVM: SettingsViewModel
    @StateObject private var tonesVM = TonesViewModel()
    
    @State private var language: Language = .english
    
    var body: some View {
        VStack {
            Text("Reset All Lessons")
                .foregroundColor(.appWhite)
                .font(.callout)
                .padding(.horizontal, 14)
                .padding(.vertical, 6)
                .background(Color.appPurple)
                .cornerRadius(8)
                .onTapGesture {
                    settingsVM.resetAllLessons()
                }
                .padding(.horizontal)
            
            VStack {
                ScrollView(showsIndicators: false) {
                    SectionView(words: tonesVM.tones,
                                title: "Tones",
                                type: .tones,
                                action: tonesVM.buttonHandler,
                                resetAction: tonesVM.reset,
                                selectable: false,
                                showReset: false)
                    
                    SectionView(words: tonesVM.tenses,
                                title: "Tenses",
                                type: .tenses,
                                action: tonesVM.buttonHandler,
                                resetAction: tonesVM.reset,
                                selectable: false,
                                showReset: false)
                    
                    SectionView(words: settingsVM.savedWords,
                                title: "Saved Words", type: .savedWords,
                                action: settingsVM.buttonHandler,
                                resetAction: settingsVM.reset,
                                selectable: false,
                                selected: true)
                }
            }
        }
        .background(Color.appBlack)
        .onAppear { settingsVM.setView() }
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                NavigationLink {
                    SearchView()
                } label: {
                    Image(systemName: "magnifyingglass.circle")
                        .resizable()
                        .scaledToFit()
                        .font(.title2)
                }

            }
        }
    }
}

//struct SettingsView_Previews: PreviewProvider {
//    static var previews: some View {
//        SettingsView()
//    }
//}
