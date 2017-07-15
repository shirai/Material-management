//
//  ReturnMaterialViewController.swift
//  Material-management
//
//  Created by shirai.makoto on 2017/07/15.
//  Copyright © 2017年 Makoto Shirai. All rights reserved.
//

import UIKit

internal final class ReturnMaterialViewController: MaterialViewController {

    override class func makeMaterials() -> [MaterialType: [Material]] {
        return [
            .cardReader: Material.materialList(type: .cardReader),
            .barcodeScanner: Material.materialList(type: .barcodeScanner),
            .iPhone: Material.materialList(type: .iPhone),
            .iPad: Material.materialList(type: .iPad)
        ]
    }

    override func onTapDoneButton() {
        guard let indexPathsForSelectedRows = tableView.indexPathsForSelectedRows else {
            let ac = UIAlertController(
                title: "機器を選択してください",
                message: "返す機器が未選択です。\n一覧から返却する端末を選択してください。",
                preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            present(ac, animated: true, completion: nil)
            return
        }
        
        indexPathsForSelectedRows.map { material(forRowAt: $0) }.forEach { (material: Material) in
            print("selectedMaterial.name = \(material.managementNumber)")
        }
    }
}

