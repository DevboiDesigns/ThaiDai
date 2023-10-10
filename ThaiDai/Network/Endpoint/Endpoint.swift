//
//  Endpoint.swift
//  ThaiDai
//
//  Created by Christopher Hicks on 10/11/23.
//

import Foundation

enum AppEnv {
    case prod
    
    var name: String {
        switch self {
        case .prod:
            return "Production"
        }
    }
}

struct Endpoint {
    var path: String
    var queryItems: [URLQueryItem] = []
    
    private var appEnv: AppEnv {
        return .prod
    }
}

extension Endpoint {
    var url: URL {
        var components = URLComponents()
        switch appEnv {
        case .prod:
            components.scheme = "https"
            components.host = "thaidai-11b9145fc716.herokuapp.com"
            components.port = nil
        }
        
        components.path = "/" + path
        components.queryItems = queryItems
        guard let url = components.url else {
            preconditionFailure("🌎 Invalid URL Components: \(components)")
        }

        print("🐞URL DEBUG: \(url)")
        print("🌎 -> App is running in: \(appEnv.name)")
 
        return url
        
    }

}

