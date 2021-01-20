//
//  ViewController.swift
//  SkeletonViewPractice
//
//  Created by Ick on 2021/01/20.
//

import UIKit
import SkeletonView

class ViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    // 데이터
    var data: [Int] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // collectionView 세팅
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        self.collectionView.register(UINib(nibName: "SkeletonCollectionViewCell", bundle: .main), forCellWithReuseIdentifier: "skeletonCell")
        
        // 컬렉션 뷰에 스켈레톤 뷰를 사용한다고 표시
        self.collectionView.isSkeletonable = true
        // 스켈레톤 뷰 애니메이션 생성
        let animation = SkeletonAnimationBuilder().makeSlidingAnimation(withDirection: .leftRight)
        // 컬렉션 뷰의 스켈레톤 뷰 애니메이션 보이게 함
        self.collectionView.showAnimatedGradientSkeleton(usingGradient: .init(baseColor: .lightGray), animation: animation, transition: .crossDissolve(0.5))
        
        // 3초 뒤엔 데이터가 생겨서 해당 데이터로 컬렉션 뷰를 reload 해줍니다.
        DispatchQueue.main.asyncAfter(deadline: .now()+3) {
            for i in 0..<10 {
                self.data.append(i)
            }
            self.collectionView.stopSkeletonAnimation()
            self.collectionView.hideSkeleton(reloadDataAfter: true)
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
}

extension ViewController: SkeletonCollectionViewDelegate {
    
}

extension ViewController: SkeletonCollectionViewDataSource {
    // 스켈레톤 뷰를 만들 셀의 id
    func collectionSkeletonView(_ skeletonView: UICollectionView, cellIdentifierForItemAt indexPath: IndexPath) -> ReusableCellIdentifier {
        return "skeletonCell"
    }
    
    // 몇 개의 스켈레톤 뷰 만들 것인지
    func collectionSkeletonView(_ skeletonView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = self.collectionView.dequeueReusableCell(withReuseIdentifier: "skeletonCell", for: indexPath) as? SkeletonCollectionViewCell else { return UICollectionViewCell() }
        if !data.isEmpty {
            cell.nameLabel.text = "\(indexPath.item)번째 핑구"
            cell.profileImageView.image = UIImage(named: "Pingu.jpeg")
        }
        return cell
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.view.frame.width, height: 110)
    }
}
