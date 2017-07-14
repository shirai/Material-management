//
//  BorrowMaterialViewController.swift
//  Material-management
//
//  Created by shirai.makoto on 2017/07/15.
//  Copyright © 2017年 Makoto Shirai. All rights reserved.
//

import UIKit

class BorrowMaterialViewController: UIViewController {

    // MARK: properties
    
    // 機器一覧
    let materials: [MaterialType: [Material]] = [
        .cardReader: Material.materialList(type: .cardReader),
        .barcodeScanner: Material.materialList(type: .barcodeScanner),
        .iPhone: Material.materialList(type: .iPhone),
        .iPad: Material.materialList(type: .iPad)
    ]

    // MARK: IBOutlets
    
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: IBActions
    
    @IBAction func onTapLogoutButton(_ sender: UIBarButtonItem) {
        
        print("TODO: ログインモーダルを表示する（プロトコルで実装）")
    }
    
    @IBAction func onTapDoneButton(_ sender: UIBarButtonItem) {

        guard let indexPathsForSelectedRows = tableView.indexPathsForSelectedRows else {
            let ac = UIAlertController(
                title: "機器を選択してください",
                message: "借りる機器が未選択です。\n一覧から借りる端末を選択してください。",
                preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            present(ac, animated: true, completion: nil)
            return
        }
        
        indexPathsForSelectedRows.map { material(forRowAt: $0) }.forEach { (material: Material) in
            print("selectedMaterial.name = \(material.managementNumber)")
        }
    }
    
    // MARK: Life Cycles
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    // MARK: Private functions
    
    func materialType(inSection section: Int) -> MaterialType {
        
        return MaterialType(rawValue: section)!
    }
    
    func materialList(inSection section: Int) -> [Material] {
        
        let type = materialType(inSection: section)
        return materials[type]!
    }
    
    func material(forRowAt indexPath: IndexPath) -> Material {
        
        return materialList(inSection: indexPath.section)[indexPath.row]
    }
}

// MARK: - UITableViewDataSource

extension BorrowMaterialViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return materials.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        return materialType(inSection: section).name
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return materialList(inSection: section).count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: UITableViewCell = {
            let reuseIdentifier = UITableViewCell.description()
            guard let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier) else {
                return UITableViewCell(style: .value1, reuseIdentifier: reuseIdentifier)
            }
            return cell
        }()
        
        let material = self.material(forRowAt: indexPath)
        cell.textLabel?.text = material.managementNumber
        cell.detailTextLabel?.text = material.modelName
        
        return cell
    }
    
}

// MARK: - UITableViewDelegate

extension BorrowMaterialViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        
        tableView.cellForRow(at: indexPath)?.accessoryType = .none
    }
}
