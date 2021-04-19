//
//  ViewController.swift
//  BaeMinScroll
//
//  Created by Ick on 2021/04/17.
//

import UIKit

class ViewController: UIViewController {

    var menuList: [UIImage] = [UIImage(named: "Pingu.jpeg")!,
                               UIImage(named: "Swift.png")!,
                               UIImage(named: "Xcode.png")!,
                               UIImage(named: "SwiftUI.png")!
                               ]
    @IBOutlet weak var menuView: UIView!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var menuImageView: UIImageView!
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var heightMenuView: NSLayoutConstraint!
    @IBOutlet weak var topMenuView: NSLayoutConstraint!
    @IBOutlet weak var bottomMenuView: NSLayoutConstraint!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        self.collectionView.addSubview(self.menuView)
        self.collectionView.register(UINib(nibName: TempCell.nibName, bundle: nil), forCellWithReuseIdentifier: TempCell.identifier)
        self.reloadMenuView()
    }
    @IBOutlet weak var topImageView: NSLayoutConstraint!
    var indexIncreasing: Bool = false
    var index = 0
    func reloadMenuView() {
        
        let contentOffset = self.collectionView.contentOffset
        let contentOffsetY = contentOffset.y > 0 ? 0 : contentOffset.y
        let height = contentOffset.y > 0 ? 0 : -contentOffset.y
        let isVisible = contentOffset.y >= 0 ? true : false
        let isVisible2 = contentOffset.y < -200 ? false : true
        self.label.isHidden = isVisible2
        self.menuImageView.isHidden = isVisible
        let frame = CGRect(x: 0, y: contentOffsetY, width: self.collectionView.bounds.width, height: height)
        self.menuView.frame = frame
        
        let imageOffset = CGFloat(Int(-contentOffsetY) % 70)
        print(imageOffset)
        if imageOffset >= 0 && imageOffset < 5 && !indexIncreasing {
            self.menuImageView.image = self.menuList[self.index % 4]
            self.index += 1
            self.indexIncreasing = true
        } else if imageOffset >= 5 {
            self.indexIncreasing = false
        }
        self.topImageView.constant = imageOffset
        self.menuImageView.alpha = 1 - (imageOffset/100)
    }
}

extension ViewController: UICollectionViewDelegate {
    
}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TempCell.identifier, for: indexPath) as? TempCell else { return TempCell() }
        cell.label.text = "\(indexPath.item)"
        return cell
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.collectionView.frame.width, height: 100)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}

extension ViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        self.reloadMenuView()
    }
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        print("END")
        print(self.menuView.frame)
        let frame = CGRect(x: 0, y: -100, width: self.collectionView.bounds.width, height: 100)
        self.collectionView.contentInset = UIEdgeInsets(top: 100, left: 0, bottom: 0, right: 0)
        self.menuView.frame = frame
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            UIView.animate(withDuration: 0.5) {
                self.collectionView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
                self.menuView.frame = CGRect(x: 0, y: 0, width: self.collectionView.frame.width, height: 0)
                self.menuImageView.alpha = 1
                self.view.layoutIfNeeded()
            }
        }
    }
}
