//
//  InterfaceApi.swift
//  DummyLogin
//
//  Created by freddy mejia on 12/11/23.
//

import Foundation
struct InterfaceApi {
    static let host = "https://292.121.12.12"
    static let api_version = "\(host)/api"
    static let endp_login = "\(api_version)/login"
    static let endp_register = "\(api_version)/register"
    
    static let dummy_endpoint = "https://jsonplaceholder.typicode.com/posts/1"
}
