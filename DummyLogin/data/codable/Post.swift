//
//  Post.swift
//  DummyLogin
//
//  Created by freddy mejia on 12/11/23.
//

import Foundation
struct Post: Codable {
    var userId: Int
    var id: Int
    var title: String
    var body: String
    init() {
        userId = 0
        id = 0
        title = ""
        body = ""
    }
}
