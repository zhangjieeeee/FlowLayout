//
//  CYGridLayout.swift
//  CustomerFlowLayout
//
//  Created by 赵张杰 on 2017/5/8.
//  Copyright © 2017年 zhaozhangjie. All rights reserved.
//

import UIKit

class CYGridLayout: UICollectionViewLayout {
    
    var attrsArray = Array<UICollectionViewLayoutAttributes>()
    
    override func prepare() {
        super.prepare()
        
        attrsArray.removeAll()
        
        let count = collectionView?.numberOfItems(inSection: 0) ?? 0
        for i in 0..<count {
            let indexPath = NSIndexPath.init(item: i, section: 0)
            let attrs = UICollectionViewLayoutAttributes.init(forCellWith: indexPath as IndexPath)
            
            let width = (collectionView?.frame.size.width)! * 0.5
            if i == 0 {
                let height = width
                let x: CGFloat = 0
                let y: CGFloat = 0
                attrs.frame = CGRect(x: x, y: y, width: width, height: height)
            } else if i == 1 {
                let height = width * 0.5
                let x = width
                let y = 0
                attrs.frame = CGRect(x: x, y: CGFloat(y), width: width, height: height)
            } else if i == 2 {
                let height = width * 0.5
                let x = width
                let y = height
                attrs.frame = CGRect(x: x, y: y, width: width, height: height)
            } else if i == 3 {
                let height = width * 0.5
                let x = 0
                let y = width
                attrs.frame = CGRect(x: CGFloat(x), y: y, width: width, height: height)
            } else if i == 4 {
                let height = width * 0.5
                let x = 0
                let y = width + height
                attrs.frame = CGRect(x: CGFloat(x), y: y, width: width, height: height)
            } else if i == 5 {
                let height = width
                let x = width
                let y = width
                attrs.frame = CGRect(x: x, y: y, width: width, height: height)
            } else {
                let lastAttrs = attrsArray[i - 6]
                var lastFrame = lastAttrs.frame
                lastFrame.origin.y += 2 * width
                attrs.frame = lastFrame
            }
            attrsArray.append(attrs)
        }
    }
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        return self.attrsArray
    }
    
    override var collectionViewContentSize: CGSize {
        let count = collectionView?.numberOfItems(inSection: 0) ?? 0
        let rows: CGFloat = (CGFloat(count) + 3 - 1)/3
        let rowH: CGFloat = (collectionView?.frame.size.width)! * 0.5
        return CGSize(width: 0, height: (rows * rowH))
    }
    
}
