//
//  Service+Lessons.swift
//  ThaiDai
//
//  Created by Christopher Hicks on 10/11/23.
//

import Foundation

extension Service {
    
    func getAllLessons(_ session: URLSession = .shared, complete: @escaping (Result<(), TDError>) -> Void) {
        session.request(.lessons, method: .get) { data, response, error in
            if let _ = error {
                complete(.failure(.unableToComplete))
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                complete(.failure(.invalidResponse))
                return
            }
            guard let data = data else {
                complete(.failure(.invalidData))
                return
            }
            
            print(data)
            complete(.success(()))
            
//            do {
//                let decoder = JSONDecoder()
//                let res = try decoder.decode(SearchUsersResponse.self, from: data)
//                complete(.success(res))
//                return
//            } catch {
//                complete(.failure(.invalidData))
//            }
        }
    }
}
