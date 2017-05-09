//
//  ViewController.swift
//  CustomerFlowLayout
//
//  Created by 赵张杰 on 2017/5/8.
//  Copyright © 2017年 zhaozhangjie. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {
    
    static let CYPhotoId = "photo"

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let layout = CYGridLayout()
        let collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: layout)
        collectionView.dataSource = self
        collectionView.delegate = self
        view.addSubview(collectionView)
        collectionView.register(UINib(nibName: "CYPhotoCell", bundle: nil
        ), forCellWithReuseIdentifier: ViewController.CYPhotoId)
    }
    
    //UICollectionViewDataSource
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
         return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: CYPhotoCell = collectionView.dequeueReusableCell(withReuseIdentifier: ViewController.CYPhotoId, for: indexPath) as! CYPhotoCell
        cell.imageName = "\(indexPath.item + 1)"
        return cell
    }
    
    //UICollectionViewDelegate
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("\(indexPath.item)")
    }
}

