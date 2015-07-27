//
//  AlbumCell.swift
//  Mega
//
//  Created by internet on 7/23/15.
//  Copyright (c) 2015 Gualy Vc. All rights reserved.
//

import Foundation
import UIKit


class MovieCell: UICollectionViewCell {
    
    @IBOutlet var coverImageView : UIImageView!
    @IBOutlet var nameLabel : UILabel!
    @IBOutlet var titleLabel : UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        nameLabel.textColor = UIColor(white: 0.7, alpha: 0.8)
        nameLabel.font = UIFont(name: MegaTheme.fontName, size: 10)
        
        titleLabel.textColor = UIColor.whiteColor()
        titleLabel.font = UIFont(name: MegaTheme.fontName, size: 14)
        
        coverImageView.layer.borderColor = UIColor(white: 0.2, alpha: 1.0).CGColor
        coverImageView.layer.borderWidth = 0.5
    }
}