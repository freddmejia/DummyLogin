//
//  FillValidates.swift
//  DummyLogin
//
//  Created by freddy mejia on 12/11/23.
//

import Foundation

struct FillValidates {
    func isValidEmail(email: String) -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        return emailPredicate.evaluate(with: email)
    }
}
