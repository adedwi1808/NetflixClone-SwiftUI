//
//  ConfigurationManager.swift
//  NetflixClone-SwiftUI
//
//  Created by Ade Dwi Prayitno on 31/08/24.
//

import Foundation

class ConfigurationManager {
    static let shared = ConfigurationManager()
    
    private init() {
    }
    
    func getValue(
        forKey key: ConfigKey
    ) -> String {
        guard let value = Bundle.main.object(
            forInfoDictionaryKey: key.rawValue
        ) as? String else {
            fatalError(
                "\(key.rawValue) must not be empty in plist"
            )
        }
        return value
    }
}

extension ConfigurationManager {
    enum ConfigKey: String {
        case tmbdAccessToken = "TmbdAccessToken"
        case tmbdApiKey = "TmbdApiKey"
        case tmbdBaseURL = "TmbdBaseURL"
    }
}
