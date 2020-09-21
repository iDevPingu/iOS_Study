//
//  CollectionView.swift
//  CollectionViewWithoutSB
//
//  Created by Ick on 2020/09/17.
//  Copyright © 2020 ick. All rights reserved.
//

import UIKit

class BountyListViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    let viewModel = BountyListViewModel()

    var collectionView: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        // Do any additional setup after loading the view.
        self.addSubviewsToView()
        print("BB")
        self.collectionViewSetting()
    
        
    }
    
    func addSubviewsToView(){
        
    }
    
    func collectionViewSetting(){
        self.collectionView = UICollectionView(frame: CGRect(), collectionViewLayout: UICollectionViewLayout())
        self.view.addSubview(self.collectionView)
        self.collectionViewFlowLayoutSetting()
        
        self.collectionView.translatesAutoresizingMaskIntoConstraints = false
        self.collectionView.register(BountyListCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        
        
        self.collectionView.backgroundColor = .white
        self.collectionView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        self.collectionView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        self.collectionView.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
        self.collectionView.rightAnchor.constraint(equalTo: self.view.rightAnchor).isActive = true
    }
    
    func collectionViewFlowLayoutSetting(){
        let flowLayout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        flowLayout.minimumLineSpacing = 1
        flowLayout.minimumInteritemSpacing = 1
        let itemSize: CGFloat = self.view.frame.width / 2 - 1
        flowLayout.itemSize = CGSize(width: itemSize, height: itemSize * 1.5)
        self.collectionView.collectionViewLayout = flowLayout
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.viewModel.numOfBountyInfoList
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell: BountyListCollectionViewCell = self.collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? BountyListCollectionViewCell else { return UICollectionViewCell()}
        cell.updateData(info: viewModel.bountyInfo(at: indexPath.item))
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let nextViewController = DetailViewController()
        nextViewController.modalPresentationStyle = .fullScreen
        let tempData = viewModel.bountyInfo(at: indexPath.item)
        nextViewController.viewModel.update(model: tempData)
        
        self.present(nextViewController, animated: true, completion: nil)
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
