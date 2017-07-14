//
//  Material.swift
//  Material-management
//
//  Created by shirai.makoto on 2017/07/15.
//  Copyright © 2017年 Makoto Shirai. All rights reserved.
//

/// 機材種別
/// - note: tableViewのsectionとして利用するのでInt型(0〜)にしています
internal enum MaterialType: Int {
    case cardReader
    case barcodeScanner
    case iPhone
    case iPad
    
    /// 機材種別名
    var name: String {
        
        switch self {
        case .cardReader:
            return "カードリーダー"
        case .barcodeScanner:
            return "バーコードスキャナー"
        case .iPhone:
            return "iPhone"
        case .iPad:
            return "iPad"
        }
    }
}


/// 機材
internal struct Material {
    /// 機材種別
    let type: MaterialType
    /// 機器管理番号
    let managementNumber: String
    /// モデル名
    let modelName: String
    
    static func materialList(type: MaterialType) -> [Material] {
        
        // TODO: DBから取得する
        switch type {
        case .cardReader:
            return [
                Material(type: .cardReader, managementNumber: "PY_TEST_4", modelName: "M-10"),
                Material(type: .cardReader, managementNumber: "PY_TEST_13", modelName: "M-10F")
            ]
        case .barcodeScanner:
            return [
                Material(type: .barcodeScanner, managementNumber: "BS_BLK", modelName: "SMobile"),
                Material(type: .barcodeScanner, managementNumber: "BS_WHT", modelName: "SMobile")
            ]
        case .iPhone:
            return []
        case .iPad:
            return [
                Material(type: .iPad, managementNumber: "DEV087", modelName: "iPad")
            ]
        }
    }
}
