//
//  UserSettings.swift
//  Drablo
//
//  Created by 송상윤 on 2021/10/27.
//

import Foundation
import Combine

class UserSettings: ObservableObject {
    var usernameLimit: Int = 16
    
    @Published var username: String {
        didSet {
            UserDefaults.standard.set(username, forKey: "username")
            if username.count > usernameLimit {
                username = String(username.prefix(usernameLimit))
            }
        }
    }
    init() {
        self.username = UserDefaults.standard.object(forKey: "username") as? String ?? ""
    }
}
