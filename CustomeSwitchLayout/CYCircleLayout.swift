//
//  CYCircleLayout.swift
//  CustomerFlowLayout
//
//  Created by 赵张杰 on 2017/5/9.
//  Copyright © 2017年 zhaozhangjie. All rights reserved.
//

import UIKit

class CYCircleLayout: UICollectionViewLayout {

    /*
     布局属性
     */
    var attrsArray = Array<UICollectionViewLayoutAttributes>()
    
    override func prepare() {
        super.prepare()
        attrsArray.removeAll()
        let count = collectionView?.numberOfItems(inSection: 0)
        for i in 0..<count! {
            let indexPath = NSIndexPath.init(item: i, section: 0)
            let attrs = layoutAttributesForItem(at: indexPath as IndexPath)
            attrsArray.append(attrs!)
        }
    }
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        return attrsArray
    }
    
    /*
     这个方法需要返回indexPath位置对应的cell布局属性
     */
    override func layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        let count = collectionView?.numberOfItems(inSection: 0)
        let radius: CGFloat = 70.0
        //圆心的位置
        let oX: CGFloat = (collectionView?.frame.size.width)! * 0.5
        let oY: CGFloat = (collectionView?.frame.size.height)! * 0.5
        
        let attrs = UICollectionViewLayoutAttributes.init(forCellWith: indexPath)
        
        attrs.size = CGSize(width: 50, height: 50)
        
        if count == 1 {
            attrs.center = CGPoint(x: oX, y: oY)
        }else {
            let angle: CGFloat = CGFloat(2.0 * M_PI) / CGFloat(count!) * CGFloat(indexPath.item)
            let centerX: CGFloat = oX + radius * CGFloat(sin(angle))
            let centerY: CGFloat = oY + radius * CGFloat(cos(angle))
            attrs.center = CGPoint(x: centerX, y: centerY)
        }
        
        return attrs
    }
    
}
