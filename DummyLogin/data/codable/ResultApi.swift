//
//  ResultApi.swift
//  DummyLogin
//
//  Created by freddy mejia on 12/11/23.
//

import Foundation

enum ResultApi<T> {
    case success(T)
    case error(String)
    case empty
    case loading
}
