//
//  SkeletonCollectionViewCell.swift
//  SkeletonViewPractice
//
//  Created by Ick on 2021/01/20.
//

import UIKit
import SkeletonView

class SkeletonCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.isSkeletonable = true
        self.profileImageView.isSkeletonable = true
        self.nameLabel.isSkeletonable = true
        self.ageLabel.isSkeletonable = true
        self.addressLabel.isSkeletonable = true
        
        self.profileImageView.skeletonCornerRadius = 10
        self.nameLabel.linesCornerRadius = 5
        self.ageLabel.linesCornerRadius = 5
        self.addressLabel.linesCornerRadius = 5
    }
}
