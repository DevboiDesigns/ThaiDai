//
//  LessonsViewModel.swift
//  ThaiDai
//
//  Created by Christopher Hicks on 10/11/23.
//

import SwiftUI

final class LessonsViewModel: BaseViewModel {
    
    override init() {
        super.init()
        getAllLessonData()
    }
    
    func getAllLessonData() {
        Service.shared.getAllLessons { result in
            switch result {
            case .success(_):
                print("SUCCESS!!!")
            case .failure(let err):
                print(err)
            }
        }
    }
}
