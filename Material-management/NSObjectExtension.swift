//
//  NSObjectExtension.swift
//  Material-management
//
//  Created by shirai.makoto on 2017/07/15.
//  Copyright © 2017年 Makoto Shirai. All rights reserved.
//

import UIKit

extension NSObject {
    /// クラス名の文字列を取得する
    static var className: String {
        return String(describing: self)
    }
    /// クラス名の文字列を取得する
    var className: String {
        return type(of: self).className
    }
}
