//
//  MaterialViewController.swift
//  Material-management
//
//  Created by shirai.makoto on 2017/07/15.
//  Copyright © 2017年 Makoto Shirai. All rights reserved.
//

import UIKit

internal class MaterialViewController: UIViewController {
    
    var materials = [MaterialType: [Material]]()
    
    // MARK: IBOutlets
    
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: IBActions
    
    @IBAction func onTapLogoutButton(_ sender: UIBarButtonItem) {
        
        print("TODO: ログインモーダルを表示する（プロトコルで実装）")
    }
    
    @IBAction func onTapDoneButton(_ sender: UIBarButtonItem) {
        
        onTapDoneButton()
    }
    
    // MARK: Life Cycles
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        materials =  type(of: self).makeMaterials()
    }
    
    // MARK: Public functions
    
    class func makeMaterials() -> [MaterialType: [Material]] {
        fatalError("required override makeMaterials().")
    }
    
    func onTapDoneButton() {
        fatalError("required override onTapDoneButton().")
    }
    
    // MARK: Private functions
    
    fileprivate func materialType(inSection section: Int) -> MaterialType {
        
        return MaterialType(rawValue: section)!
    }
    
    fileprivate func materialList(inSection section: Int) -> [Material] {
        
        let type = materialType(inSection: section)
        return materials[type]!
    }
    
    fileprivate func material(forRowAt indexPath: IndexPath) -> Material {
        
        return materialList(inSection: indexPath.section)[indexPath.row]
    }
}

// MARK: - UITableViewDataSource

extension MaterialViewController: UITableViewDataSource {
    
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

extension MaterialViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        
        tableView.cellForRow(at: indexPath)?.accessoryType = .none
    }
}
