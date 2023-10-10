//
//  Service.swift
//  ThaiDai
//
//  Created by Christopher Hicks on 10/11/23.
//

import Foundation
import UIKit

final class Service {
    
    private init() { }
    static let shared = Service()
//    static let oneSignalAppId = "f5d2a723-6c45-4d23-83ca-e57b17003701"
    private let defaults = UserDefaults.standard
    
    var deviceId: String {
        UIDevice.current.identifierForVendor?.uuidString ?? "NO_DEVICE_ID"
    }
    
    /// HEADERS
    var baseHeaders: [String : String] {
        return [
            "Accept": "application/json",
            "Content-Type": "application/json",
            "Device-ID": "\(deviceId)"
        ]
    }
    
    /// HTTP Methods
    enum Methods: String {
        case get = "GET"
        case post = "POST"
        case put = "PUT"
        case patch = "PATCH"
        case delete = "DELETE"
    }
}
