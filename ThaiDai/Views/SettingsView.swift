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
            ScrollView(showsIndicators: false) {
                SectionView(words: settingsVM.savedWords,
                            title: "Saved Words",
                            language: $language,
                            action: settingsVM.buttonHandler,
                            resetAction: settingsVM.reset)
            }
        }
        .background(Color.appBlack)
        .onAppear { settingsVM.setView() }
    }
}

//struct SettingsView_Previews: PreviewProvider {
//    static var previews: some View {
//        SettingsView()
//    }
//}
