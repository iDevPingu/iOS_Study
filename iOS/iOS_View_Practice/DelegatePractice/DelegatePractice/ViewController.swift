//
//  ViewController.swift
//  DelegatePractice
//
//  Created by Ick on 2021/02/16.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myView: MyView!
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let mymyView = Bundle.main.loadNibNamed("MyView", owner: nil, options: nil)
        guard let myViewReal = mymyView?.first as? MyView else { return }
        myViewReal.frame = CGRect(x: 100, y: 300, width: 200, height: 200)
        self.view.addSubview(myViewReal)
        myViewReal.delegate = self
        
        self.tableView.register(UINib(nibName: MyCell.nibName, bundle: .main), forCellReuseIdentifier: MyCell.identifier)
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
}

extension ViewController: UITableViewDelegate {
    
}
extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = self.tableView.dequeueReusableCell(withIdentifier: MyCell.identifier, for: indexPath) as? MyCell else { return UITableViewCell() }
        cell.myLabel.text = "\(indexPath.row)번째 Cell"
        cell.delegate = self
        return cell
    }
}

extension ViewController: MyCellDelegate {
    func labelTextReturn(text: String?) {
        print(text)
    }
}

extension ViewController: MyViewDelegate {
    func touchUp(_ str: String) {
        print(str)
    }
}
