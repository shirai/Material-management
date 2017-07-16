//
//  LoginViewController.swift
//  Material-management
//
//  Created by shirai.makoto on 2017/07/15.
//  Copyright © 2017年 Makoto Shirai. All rights reserved.
//

import UIKit

protocol LoginViewControllerDelegate: class {
    func didLogin(in: User)
}

internal final class LoginViewController: UIViewController {

    // MARK: Properties
    
    weak var delegate: LoginViewControllerDelegate?
    
    /// ユーザー一覧
    fileprivate var users = [Team: [User]]()
    
    // MARK: IBOutlets
    
    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    // MARK: IBActions
    @IBAction private func changedSegment(_ sender: UISegmentedControl) {
        
        tableView.reloadData()
    }
    
    @IBAction private func onTapCloseButton(_ sender: UIButton) {
        
        dismiss(animated: true, completion: nil)
    }
    
    // MARK: Life Cycles
    
    override func viewDidLoad() {
        super.viewDidLoad()

        users = [
            .engineer: User.userList(team: .engineer),
            .qa: User.userList(team: .qa)
        ]
    }
}

extension LoginViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        // All選択時はチームごとにセクションを分けて表示する
        return segmentedControl.selectedSegmentIndex == 0 ? users.count : 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        
        let team = Team(rawValue: segmentedControl.selectedSegmentIndex) ?? {
            // チーム変換できない ＝ 「All」選択中とみなす
            // ここの+1なんとかしたいけど、segmentとsectionの同期が難しい
            return Team(rawValue: section + 1)!
        }()
        
        return users[team]!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: UITableViewCell.description()) ?? {
            return UITableViewCell(style: .value1, reuseIdentifier: UITableViewCell.description())
        }()
        
        let team = Team(rawValue: segmentedControl.selectedSegmentIndex) ?? Team(rawValue: indexPath.section + 1)!
        let user = users[team]![indexPath.row]
        cell.textLabel?.text = user.name
        
        return cell
    }
}

extension LoginViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // TODO: ユーザー選択処理
        
        dismiss(animated: true, completion: nil)
    }
}
