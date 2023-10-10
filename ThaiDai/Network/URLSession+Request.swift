//
//  URLSession+Request.swift
//  ThaiDai
//
//  Created by Christopher Hicks on 10/11/23.
//

import Foundation
import UIKit

extension URLSession {
    typealias Handler = (Data?, URLResponse?, Error?) -> Void
    
    @discardableResult
    func request(_ endpoint: Endpoint, method: Service.Methods, the handler: @escaping Handler) -> URLSessionDataTask {
        var request = URLRequest(url: endpoint.url)
        request.allHTTPHeaderFields = Service.shared.baseHeaders
        request.httpMethod = method.rawValue
        let task = dataTask(with: request, completionHandler: handler)
        task.resume()
        return task
    }
    
    @discardableResult
    func request(_ endpoint: Endpoint, method: Service.Methods, body: Data?, the handler: @escaping Handler) -> URLSessionDataTask {
        var request = URLRequest(url: endpoint.url)
        request.allHTTPHeaderFields = Service.shared.baseHeaders
        request.httpMethod = method.rawValue
        if let body = body {
            request.httpBody = body
        }
        let task = dataTask(with: request, completionHandler: handler)
        task.resume()
        return task
    }
}

