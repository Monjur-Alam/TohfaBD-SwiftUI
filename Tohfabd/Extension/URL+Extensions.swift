//
//  URL+Extensions.swift
//  Tohfabd
//
//  Created by MacBook Pro on 29/12/22.
//

import Foundation

extension URL {
    
    static func loginAccountUrl() -> URL? {
        return URL(string: "\(Constants.BASE_URL)personal-phone-number-check")
    }
}

// Converts encodable structure to dictionary.
extension Encodable {
    var dictionary: [String: Any]? {
        guard let data = try? JSONEncoder().encode(self) else { return nil }
        return (try? JSONSerialization.jsonObject(with: data, options: .allowFragments)).flatMap { $0 as? [String: Any] }
    }
}
