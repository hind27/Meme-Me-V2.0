//
//  SentMemesCollectionVC.swift
//  Meme Me
//
//  Created by hind on 12/28/18.
//  Copyright © 2018 hind. All rights reserved.
//

import UIKit



class SentMemesCollectionVC: UICollectionViewController {
    
    var memes: [Meme] {
        return (UIApplication.shared.delegate as! AppDelegate).memes
    }

    @IBOutlet var memecollectionView: UICollectionView!
    @IBOutlet weak var flowLayout: UICollectionViewFlowLayout!
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        memecollectionView!.reloadData()
        tabBarController?.tabBar.isHidden = false
       
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Sent Memes"
        let space:CGFloat
        let dimension :CGFloat
        if (UIDeviceOrientationIsLandscape(UIDevice.current.orientation)) {
            space = 1.0
            dimension = (view.frame.size.width - (1 * space)) / 5
        }else{
            space = 2.0
            dimension = (view.frame.size.width - (2 * space)) / 3
        }
        flowLayout.minimumInteritemSpacing = space
        flowLayout.minimumLineSpacing = space
        flowLayout.itemSize = CGSize(width: dimension, height: dimension)
    }
    

    
    // MARK: UICollectionViewDataSource
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // return the number of items
        return  self.memes.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CustomMemeCell", for: indexPath) as! CollectionCell
        // Set the image
        let image = memes[indexPath.row]
        cell.cellImageView?.image = image.memedImage
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // Grab the DetailVC from Storyboard
        let detailController = self.storyboard!.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        let me = memes[(indexPath as NSIndexPath).row]
        //Populate view controller with data from the selected item
        detailController.memes = me
        navigationController!.pushViewController(detailController, animated: true)
        
    }
    
}

