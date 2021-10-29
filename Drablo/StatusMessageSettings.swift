//
//  StatusMessageSettings.swift
//  Drablo
//
//  Created by 송상윤 on 2021/10/27.
//

import Foundation
import Combine

class StatusMessageSettings: ObservableObject {
    var messageLimit: Int = 30
    
    @Published var statusMessage: String {
        didSet {
            UserDefaults.standard.set(messageLimit, forKey: "statusMessage")
            if statusMessage.count > messageLimit {
                statusMessage = String(statusMessage.prefix(messageLimit))
            }
        }
    }
    init() {
        self.statusMessage = UserDefaults.standard.object(forKey: "statusMessage") as? String ?? ""
    }
}

