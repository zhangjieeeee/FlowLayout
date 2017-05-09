//
//  CYPhotoCell.swift
//  CustomerFlowLayout
//
//  Created by 赵张杰 on 2017/5/8.
//  Copyright © 2017年 zhaozhangjie. All rights reserved.
//

import UIKit

class CYPhotoCell: UICollectionViewCell {

    
    @IBOutlet weak var imageView: UIImageView!
    
    var imageName: String? {
        didSet {
            if let name = imageName {
                imageView.image = UIImage.init(named: "\(name).jpg")
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        imageView.layer.borderColor = UIColor.white.cgColor
        imageView.layer.borderWidth = 10
    }
    
    

}
