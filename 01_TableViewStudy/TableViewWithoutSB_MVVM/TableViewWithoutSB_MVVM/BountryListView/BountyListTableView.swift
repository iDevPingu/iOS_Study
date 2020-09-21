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
    
    // MVVM

    // Model
    // -> BountyInfo
    // BountyInfo 만들기

    // View
    // Cell
    // Cell에 필요한 정보를 ViewModel에게 받겠다
    // Cell은 ViewModel로 부터 받은 정보로 뷰 업데이트

    // ViewModel
    // BountyViewModel 만들고, View Layer에서 필요한 메서드 만들기
    // Model 가지고 있기, 즉 BountyInfo 들을 가지고 있어야함
    let viewModel = BountyViewModel()
    
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
        
        self.tableView.register(BountyListTableViewCell.self, forCellReuseIdentifier: reuseIdentifier)
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
        return viewModel.numOfBountyInfoList
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell: BountyListTableViewCell = self.tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as? BountyListTableViewCell else { return UITableViewCell()}
        cell.updateData(info: viewModel.bountyInfo(at: indexPath.row))
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let nextViewController: DetailViewController = DetailViewController()
        nextViewController.modalPresentationStyle = .fullScreen
        let tempData = viewModel.bountyInfo(at: indexPath.row)
        nextViewController.viewModel.update(model: tempData)
        
        self.present(nextViewController, animated: true, completion: nil)
        
        
    }
    
    
}


