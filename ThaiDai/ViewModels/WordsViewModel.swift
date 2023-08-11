//
//  WordsViewModel.swift
//  ThaiDai
//
//  Created by Christopher Hicks on 8/11/23.
//

import SwiftUI


final class WordsViewModel: BaseViewModel {
    @Published var words: [Word] = Bundle.main.decode("lesson.json")
    


}
    
