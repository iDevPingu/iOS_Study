//
//  ViewController.swift
//  BaeMinScroll
//
//  Created by Ick on 2021/04/17.
//

import UIKit

class ViewController: UIViewController {

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
        
        if Int(contentOffsetY) % 20 == 0 {
            self.menuImageView.image = UIImage(named: "Pingu.jpeg")
        } else if Int(contentOffsetY) % 4 == -1 {
            self.menuImageView.image = UIImage(named: "Swift.png")
        } else if Int(contentOffsetY) % 4 == -2 {
            self.menuImageView.image = UIImage(named: "Xcode.png")
        } else if Int(contentOffsetY) % 4 == -3 {
            self.menuImageView.image = UIImage(named: "SwiftUI.png")
        }
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
        
        reloadMenuView()
//        if scrollView.contentOffset.y < 0 {
//            print(scrollView.contentOffset)
//            bottomMenuView.constant = -scrollView.contentOffset.y
//        } else {
//            bottomMenuView.constant = 0
//        }
    }
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        print("END")
        print(self.menuView.frame)
        let frame = CGRect(x: 0, y: -100, width: self.collectionView.bounds.width, height: 100)
        self.collectionView.contentInset = UIEdgeInsets(top: 100, left: 0, bottom: 0, right: 0)
        self.menuView.frame = frame
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            UIView.animate(withDuration: 0.5) {
                self.collectionView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
                self.menuView.frame = CGRect(x: 0, y: 0, width: self.collectionView.frame.width, height: 0)
                self.view.layoutIfNeeded()
            }
        }
    }
}
