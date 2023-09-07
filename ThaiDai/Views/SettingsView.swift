//
//  SettingsView.swift
//  ThaiDai
//
//  Created by Christopher Hicks on 8/12/23.
//

import SwiftUI

struct SettingsView: View {
    @StateObject var settingsVM: SettingsViewModel
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
                .padding(.top)
            
            VStack {
                ScrollView(showsIndicators: false) {
                    SectionView(words: settingsVM.savedWords,
                                title: "Saved Words",
                                language: $language,
                                action: settingsVM.buttonHandler,
                                resetAction: settingsVM.reset,
                                selectable: false,
                                selected: true)
                }
            }
            .padding()
            .padding(.top)
            
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
