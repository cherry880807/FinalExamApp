//
//  PictureWallViewController.swift
//  期末-天氣app
//
//  Created by User03 on 2019/6/21.
//  Copyright © 2019 00657123. All rights reserved.
//

import UIKit

class PictureWallViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    var photoArray:[String]=["01","02","03","04","05","06","07","08","09","10","11","12","13","14","15","16","17","18"]
    


    @IBOutlet weak var collectionViewControl: UICollectionView!
    @IBOutlet weak var collectionLayout: UICollectionViewFlowLayout!
    let fullScreenSize = UIScreen.main.bounds.size
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionLayout.sectionInset = UIEdgeInsets(top: 9, left: 9, bottom: 9, right: 9)//間隔
        collectionLayout.itemSize = CGSize(width: fullScreenSize.width/3-13,height: 100)//大小
        collectionLayout.scrollDirection = .vertical//滑動
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photoArray.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "photoCell", for: indexPath) as! PhotoCollectionViewCell
        cell.cellImageView.image = UIImage(named: photoArray[indexPath.row])
        
        return cell
    }
    //let cell = collectionView.dequeueReusableCell(withReuseIdentifier:"photoCell", for: indexPath) as! CollectionViewCell
    //self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
}
