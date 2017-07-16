//
//  User.swift
//  Material-management
//
//  Created by shirai.makoto on 2017/07/16.
//  Copyright © 2017年 Makoto Shirai. All rights reserved.
//

import UIKit
import RealmSwift

/// チーム
/// - note: segmentedControlのindexとして利用するのでInt型(1〜)にしています
/// 0: All
internal enum Team: Int {
    case engineer = 1
    case qa
    
    /// チーム名
    var name: String {
        
        switch self {
        case .engineer:
            return "Engineer"
        case .qa:
            return "QA"
        }
    }
}


internal struct User {
    
    let name: String
//    let kanaName = ""
//    let romajiName = ""
    let team: Team
    
    static func userList(team: Team) -> [User] {
        
        switch team {
        case .engineer:
            return [
                User(name: "結城", team: .engineer),
                User(name: "白井", team: .engineer)
            ]
        case .qa:
            return [
                User(name: "中島", team: .qa)
            ]
        }
    }
}
