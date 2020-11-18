//
//  NetworkConfig.swift
//  olivia-test
//
//  Created by Leandro Souza da Silva (P) on 17/11/20.
//  Copyright © 2020 Leandro Souza da Silva (P). All rights reserved.
//

import Foundation

class NetworkConfig: Decodable {
    private enum CodingKeys: String, CodingKey {
        case baseUrl = "BaseUrl"
    }

    let baseUrl: String
    
    class func parseConfig() -> NetworkConfig {
        let url = Bundle.main.url(forResource: "NetworkConfig", withExtension: "plist")!
        let data = try! Data(contentsOf: url)
        let decoder = PropertyListDecoder()
        return try! decoder.decode(NetworkConfig.self, from: data)
    }
}
