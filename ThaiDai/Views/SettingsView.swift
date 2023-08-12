//
//  SettingsView.swift
//  ThaiDai
//
//  Created by Christopher Hicks on 8/12/23.
//

import SwiftUI

struct SettingsView: View {
    var body: some View {
        VStack {
            List {
                Text("Settings View")
                
                Section("Main") {
                    Text("More settings")
                }
            }
        }
        .background(Color.appBlack)
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
