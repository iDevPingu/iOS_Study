//
//  ViewController.swift
//  CollectionViewDynamicHeight
//
//  Created by Ick on 2021/04/07.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setCollectionView()
    }

    func setCollectionView() {
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        self.collectionView.register(UINib(nibName: CollectionViewCell.nibName, bundle: nil), forCellWithReuseIdentifier: CollectionViewCell.identifier)
    }

}
extension ViewController: UICollectionViewDelegate {
    
}
extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = self.collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell.identifier, for: indexPath) as? CollectionViewCell else { return CollectionViewCell() }
        
        if indexPath.item % 2 == 0 {
            cell.imageView.image = UIImage(named: "Pingu")
            cell.textView.text = "Hello\nThis\nis\nPingu"
        } else {
            cell.imageView.image = UIImage(named: "Swift")
            cell.textView.text = "안녕하세요 이건 스위프트\n정말 재밌는 스위프트\n너무 좋아요"
        }
        return cell
    }
}
extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        guard let cell = self.collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell.identifier, for: indexPath) as? CollectionViewCell else { return CGSize(width: 0, height: 0) }
        if indexPath.item % 2 == 0 {
            cell.imageView.image = UIImage(named: "Pingu")
            cell.textView.text = "Hello\nThis\nis\nPingu"
        } else {
            cell.imageView.image = UIImage(named: "Swift")
            cell.textView.text = "안녕하세요 이건 스위프트\n정말 재밌는 스위프트\n너무 좋아요"
        }
        print("before size to fit : \(cell.imageView.frame.height)")
        print("before size to fit : \(cell.textView.frame.height)")
        cell.imageView.sizeToFit()
        cell.textView.sizeToFit()
        print("textView Content Size: \(cell.textView.contentSize)")
        print("after size to fit : \(cell.imageView.frame.height)")
        print("after size to fit : \(cell.textView.frame.height)\n")
        
        let height = 250 + cell.textView.frame.height + 40
        return CGSize(width: self.collectionView.frame.width, height: height)
    }
}
