//
//  DetailViewController.swift
//  Meme Me
//
//  Created by hind on 12/29/18.
//  Copyright © 2018 hind. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    var memes : Meme!
    @IBOutlet weak var memeImage: UIImageView!
    
    override func viewWillAppear(_ animated: Bool) {
         super.viewWillAppear(true)
        
        memeImage.image = memes.memedImage
        
        self.tabBarController?.tabBar.isHidden = true
    }
}


