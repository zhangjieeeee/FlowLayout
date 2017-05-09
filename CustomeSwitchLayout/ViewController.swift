//
//  ViewController.swift
//  CustomeSwitchLayout
//
//  Created by 赵张杰 on 2017/5/9.
//  Copyright © 2017年 zhaozhangjie. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate {
    
    static let CYPhotoId = "photo"
    
    var imageNames = { () -> Array<String> in
        var imageNames = Array<String>()
        for i in 0..<20 {
            imageNames.append("\(i+1)")
        }
        return imageNames
    }()
    
    var collectionView: UICollectionView?

    override func viewDidLoad() {
        super.viewDidLoad()
        //创建布局
        let layout = CYCircleLayout()
        //创建collectionView
        let collectionW = view.frame.width
        let collectionH = 200
        let frame = CGRect(x: 0, y: 150, width: Int(collectionW), height: collectionH)
        collectionView = UICollectionView(frame: frame, collectionViewLayout: layout)
        collectionView?.delegate = self
        collectionView?.dataSource = self
        view.addSubview(collectionView!)
        
        //注册
        collectionView? .register(UINib(nibName: "CYPhotoCell", bundle: nil), forCellWithReuseIdentifier: ViewController.CYPhotoId)
        
    }
    
    //UICollectionViewDataSource
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageNames.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: CYPhotoCell = collectionView.dequeueReusableCell(withReuseIdentifier: ViewController.CYPhotoId, for: indexPath) as! CYPhotoCell
        cell.imageName = imageNames[indexPath.item]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        imageNames.remove(at: indexPath.item)
        collectionView.deleteItems(at: [indexPath])
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        if collectionView?.collectionViewLayout is CYLineLayout {
            collectionView?.setCollectionViewLayout(CYCircleLayout(), animated: false)
        }else {
            let layout = CYLineLayout()
            layout.itemSize = CGSize(width: 100, height: 100)
            collectionView?.setCollectionViewLayout(layout, animated: false)
        }
        
    }
}

