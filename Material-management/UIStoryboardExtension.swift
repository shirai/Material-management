//
//  UIStoryboardExtension.swift
//  Material-management
//
//  Created by shirai.makoto on 2017/07/15.
//  Copyright © 2017年 Makoto Shirai. All rights reserved.
//

import UIKit

extension UIStoryboard {

    /// storyboard名からViewControllerを取得する
    ///
    /// - note: 1画面1storyboardの前提で、initialViewControllerを取得します。
    class func instantiateInitialViewController(name: String) -> UIViewController {
        let sb = UIStoryboard(name: className, bundle: nil)
        return sb.instantiateInitialViewController()!
    }
    
    /// クラス名からViewControllerを取得する
    ///
    /// - note: 1画面1storyboardの前提で、initialViewControllerを取得します。
    class func instantiateInitialViewController<T: UIViewController>(classType: T.Type) -> UIViewController {
        
        let sb = UIStoryboard(name: classType.className, bundle: nil)
        return sb.instantiateInitialViewController()!
    }
}
