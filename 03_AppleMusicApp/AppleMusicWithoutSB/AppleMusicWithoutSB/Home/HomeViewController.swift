//
//  ViewController.swift
//  AppleMusicWithoutSB
//
//  Created by Ick on 2020/09/17.
//  Copyright © 2020 ick. All rights reserved.
//

import UIKit

private let reusecellIdentifier = "cell"
private let reuseHeaderIdentifier = "header"
class HomeViewController: UIViewController {

    let trackManager: TrackManager = TrackManager()
    var collectionView: UICollectionView!
    var headerView : UICollectionReusableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.view.backgroundColor = .none
        self.collectionViewSetting()
    }
    
    func collectionViewSetting(){
        self.collectionView = UICollectionView(frame: CGRect(), collectionViewLayout: UICollectionViewLayout())
        self.view.addSubview(self.collectionView)
        self.collectionViewHeaderViewSetting()
        self.collectionViewFlowLayoutSetting()
        self.collectionView.translatesAutoresizingMaskIntoConstraints = false
        self.collectionView.register(HomeViewCell.self, forCellWithReuseIdentifier: reusecellIdentifier)
        self.collectionView.register(HomeHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: reuseHeaderIdentifier)
        self.collectionView.backgroundColor = .white
        self.collectionView.delegate = self
        self.collectionView.dataSource = self

        self.collectionView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        self.collectionView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        self.collectionView.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
        self.collectionView.rightAnchor.constraint(equalTo: self.view.rightAnchor).isActive = true

    }
    
    func collectionViewHeaderViewSetting(){
        self.headerView = UICollectionReusableView()
        self.view.addSubview(self.headerView)
    }
    
    func collectionViewFlowLayoutSetting(){
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.minimumLineSpacing = 10
        flowLayout.minimumInteritemSpacing = 10
        self.collectionView.collectionViewLayout = flowLayout
    }
    
}

extension HomeViewController: UICollectionViewDelegate{
    
}

extension HomeViewController: UICollectionViewDataSource{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return trackManager.tracks.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell: HomeViewCell = self.collectionView.dequeueReusableCell(withReuseIdentifier: reusecellIdentifier, for: indexPath) as? HomeViewCell else { return UICollectionViewCell() }
        let track = trackManager.track(at: indexPath.item)
        cell.updateData(item: track)
        return cell
    }
    
    // 헤더 뷰
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            guard let item = trackManager.todayTrack else { return UICollectionReusableView() }
            guard let header = self.collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: reuseHeaderIdentifier, for: indexPath) as? HomeHeaderView else { return UICollectionReusableView() }
            header.update(with: item)
            
            header.tapHandler = { item -> Void in
                // 플레이어를 띄운다
                let nextView = PlayerViewController()
                
                self.present(nextView, animated: true, completion: nil)
            }
            return header
        default:
            return UICollectionReusableView()
        }
    }
}

extension HomeViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let itemSpacing: CGFloat = 10
        let width: CGFloat = (collectionView.bounds.width - itemSpacing) / 2
        let height: CGFloat = width + 40
        
        return CGSize(width: width, height: height)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        let width: CGFloat = self.collectionView.frame.width
        let height: CGFloat = width * 0.7
        
        return CGSize(width: width, height: height)
    }
}

