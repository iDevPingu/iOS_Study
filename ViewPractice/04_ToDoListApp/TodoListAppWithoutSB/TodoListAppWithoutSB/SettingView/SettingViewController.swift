//
//  SettingViewController.swift
//  TodoListAppWithoutSB
//
//  Created by Ick on 2020/09/25.
//  Copyright © 2020 ick. All rights reserved.
//

import UIKit

private var reuseIdentifier = "cell"
class SettingViewController: UIViewController {

    var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableViewSetting()
        // Do any additional setup after loading the view.
    }
    
    func tableViewSetting(){
        let tableView = UITableView(frame: self.view.frame, style: .insetGrouped)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        self.tableView = tableView
        self.view.addSubview(self.tableView)
        self.tableView.dataSource = self
        self.tableView.register(SettingViewCell.self, forCellReuseIdentifier: reuseIdentifier)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension SettingViewController: UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell: SettingViewCell = self.tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as? SettingViewCell else { return UITableViewCell() }
        if indexPath.row == 0 {
            cell.menuLabel.text = "Support"
        } else if indexPath.row == 1{
            cell.menuLabel.text = "About"
        } else {
            cell.menuLabel.text = "Version"
        }
        
        return cell
    }
    // 헤더뷰 텍스트 바꾸기
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "SettingTable"
    }
    
}
