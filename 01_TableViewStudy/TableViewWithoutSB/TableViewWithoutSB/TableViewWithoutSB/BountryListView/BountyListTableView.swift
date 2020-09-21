//
//  ViewController.swift
//  TableViewWithoutSB
//
//  Created by Ick on 2020/09/16.
//  Copyright © 2020 ick. All rights reserved.
//

import UIKit

private let reuseIdentifier = "cell"

class BountyListTableView: UIViewController ,UITableViewDataSource, UITableViewDelegate {
    
    
    let nameList: [String] = ["luffy","zoro","sanji","nami","chopper","robin","brook","franky"]
//    let bountyList: [String] = ["300000000","120000000","77000000","16000000","50","80000000","33000000","44000000"]
    
    let data: [String: Int] = ["luffy":300000000, "zoro": 120000000, "sanji": 77000000, "nami": 16000000, "robin":80000000, "chopper": 50, "brook": 33000000, "franky": 44000000]
    
    var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    func tableViewSetting(){
        self.view.addSubview(self.tableView)
        self.tableView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        self.tableView.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
        self.tableView.rightAnchor.constraint(equalTo: self.view.rightAnchor).isActive = true
        self.tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        
        // 셀 등록하기
        self.tableView.register(BountyListTableViewCell.self, forCellReuseIdentifier: reuseIdentifier)
        // 데이터 소스를 self로 지정
        self.tableView.dataSource = self
        self.tableView.delegate = self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.view.backgroundColor = .white
        self.tableViewSetting()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return nameList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell: BountyListTableViewCell = self.tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as? BountyListTableViewCell else { return UITableViewCell()}
        cell.imgView.image = UIImage(named: "\(nameList[indexPath.row]).jpg")
        cell.nameLabel.text = nameList[indexPath.row]
        guard let bounty = data[nameList[indexPath.row]] else { return cell }
        cell.bountyLabel.text = String(bounty)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let nextViewController: DetailViewController = DetailViewController()
        nextViewController.modalPresentationStyle = .fullScreen
        
        nextViewController.imgView.image = UIImage(named: "\(nameList[indexPath.row]).jpg")
        guard let bounty = data[nameList[indexPath.row]] else { return }
        nextViewController.bountyLabel.text = String(bounty)
        nextViewController.nameLabel.text = nameList[indexPath.row]
        
        self.present(nextViewController, animated: true, completion: nil)
        
        
    }
    
    
}

