//
//  CYLineLayout.swift
//  CustomerFlowLayout
//
//  Created by 赵张杰 on 2017/5/9.
//  Copyright © 2017年 zhaozhangjie. All rights reserved.
//

import UIKit

class CYLineLayout: UICollectionViewFlowLayout {

    /*
     当collectionView的显示范围发生改变的时候是需要刷新布局的
     一旦刷新布局，就会重新调用下面的方法
     prepareLayout
     layoutAttributesForElementsInRect
     */
    override func prepare() {
        super.prepare()
        //设置横向滚动
        self.scrollDirection = .horizontal
        //设置内边距
        let inset = ((collectionView?.frame.size.width)! - self.itemSize.width) * 0.5
        sectionInset = UIEdgeInsetsMake(0, inset, 0, inset)
    }
    
    override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
        return true
    }
    
    /*
     UICollectionViewLayoutAttributes * attrs;
     1,一个cell对应一个UICollectionViewLayoutAttributes对象
     2，UICollectionViewLayoutAttributes对象决定了cell的frame
     */
    //这个方法的返回值是一个数组 数组里存储着rect范围内的所有元素的布局属性
    //这个方法的返回值决定了rect范围内的所有元素的排布（frame）
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        //获得super已经计算好的布局属性
        let array = super.layoutAttributesForElements(in: rect)
        //计算collectionView最中心点的X值
        let centerX = (collectionView?.contentOffset.x)! + (collectionView?.frame.size.width)! * 0.5
        //在原有布局属性的基础上，进行微调
        for attrs in array! {
            //cell的中心点 x 和 collectionView最中心点的x值 的间距
            let delta = abs(attrs.center.x - centerX)
            //根据间距值计算cell的缩放比例
            let scale = 1 - delta / (collectionView?.frame.size.width)!
            attrs.transform = .init(scaleX: scale, y: scale)
        }
        return array
    }
    
    /*
     这个方法返回值，决定了collectionView停止滚动时的偏移量
     */
    
    override func targetContentOffset(forProposedContentOffset proposedContentOffset: CGPoint, withScrollingVelocity velocity: CGPoint) -> CGPoint {
        //计算出最终显示的矩形框
        var rect: CGRect = CGRect.zero
        rect.origin.x = proposedContentOffset.x
        rect.origin.y = 0
        rect.size = (collectionView?.frame.size)!
        //获得super已经计算好的布局属性
        let array = super.layoutAttributesForElements(in: rect)
        //计算collectionView 最中心点的x值
        let centerX = proposedContentOffset.x + (collectionView?.frame.size.width)! * 0.5
        //存放最小的间距值
        var minDelta: CGFloat = CGFloat(MAXFLOAT)
        for attrs in array! {
            if abs(minDelta) > abs(attrs.center.x - centerX) {
                minDelta = attrs.center.x - centerX
            }
        }
        //修改原有的偏移量
        var contentOffset: CGPoint = proposedContentOffset
        contentOffset.x += minDelta
        return contentOffset
    }
}
