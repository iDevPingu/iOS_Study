//
//  CollectionViewCell.swift
//  CollectionViewDynamicHeight
//
//  Created by Ick on 2021/04/07.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    static let identifier = "CollectionViewCell"
    static let nibName = "CollectionViewCell"
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var textView: UITextView!
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

}
