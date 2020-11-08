//
//  TodoListViewController.swift
//  TodoListAppWithoutSB
//
//  Created by Ick on 2020/09/25.
//  Copyright © 2020 ick. All rights reserved.
//

import UIKit

private let reuseIdentifier = "cell"
private let reuseHeaderIdentifier = "header"
class TodoListViewController: UIViewController {

    let todoListViewModel = TodoViewModel()
    
    var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .none
        self.collectionViewSetting()
        // Do any additional setup after loading the view.
        
        todoListViewModel.loadTasks()
    }
    
    func collectionViewSetting(){
        self.collectionView = UICollectionView(frame: CGRect(), collectionViewLayout: UICollectionViewFlowLayout())
        self.view.addSubview(self.collectionView)
        self.collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        self.collectionView.register(TodoListViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        self.collectionView.register(TodoListViewHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: reuseHeaderIdentifier)
        
        self.collectionView.backgroundColor = .white
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        self.collectionView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        self.collectionView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        self.collectionView.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
        self.collectionView.rightAnchor.constraint(equalTo: self.view.rightAnchor).isActive = true
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

extension TodoListViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0{
            return todoListViewModel.todayTodos.count
        } else {
            return todoListViewModel.upcompingTodos.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell: TodoListViewCell = self.collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? TodoListViewCell else { return UICollectionViewCell() }
        var todo: Todo
        if indexPath.section == 0 {
            todo = todoListViewModel.todayTodos[indexPath.item]
        } else {
            todo = todoListViewModel.upcompingTodos[indexPath.item]
        }
//        cell.updateUI(todo: todo)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind{
        case UICollectionView.elementKindSectionHeader:
            guard let header = self.collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: reuseHeaderIdentifier, for: indexPath) as? TodoListViewHeaderView else { return UICollectionReusableView() }
            header.dateLabel.text = "Today"
            return header
        default:
            return UICollectionReusableView()
        }
    }
    
}

extension TodoListViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = self.collectionView.bounds.width
        let height: CGFloat = 50
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        let width = self.collectionView.bounds.width
        let height: CGFloat = 50
        return CGSize(width: width, height: height)
    }
}
