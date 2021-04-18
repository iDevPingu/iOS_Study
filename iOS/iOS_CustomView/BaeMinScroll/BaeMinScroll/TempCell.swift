//
//  TempCell.swift
//  BaeMinScroll
//
//  Created by Ick on 2021/04/18.
//

import UIKit

class TempCell: UICollectionViewCell {
    static let identifier = "TempCell"
    static let nibName = "TempCell"
    
    @IBOutlet weak var label: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
}
