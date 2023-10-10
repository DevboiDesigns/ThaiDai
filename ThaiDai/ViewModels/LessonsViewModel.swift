//
//  LessonsViewModel.swift
//  ThaiDai
//
//  Created by Christopher Hicks on 10/11/23.
//

import SwiftUI

final class LessonsViewModel: BaseViewModel {
    
    @Published var lessonData: [LessonData]? = nil
    
    override init() {
        super.init()
        getAllLessonData()
    }
    
    func getAllLessonData() {
        Service.shared.getAllLessons { [weak self] result in
            switch result {
            case .success(let res):
                DispatchQueue.main.async { self?.lessonData = res.response }
            case .failure(let err):
                print(err)
            }
        }
    }
}
