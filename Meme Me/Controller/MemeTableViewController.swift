//
//  MemeTableViewController.swift
//  Meme Me
//
//  Created by hind on 12/28/18.
//  Copyright © 2018 hind. All rights reserved.
//

import UIKit

class SentMemesTableViewController: UITableViewController{
   
    var memes: [Meme] {
        return (UIApplication.shared.delegate as! AppDelegate).memes
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tabBarController?.tabBar.isHidden = false
        navigationController?.isNavigationBarHidden = false
        tableView?.reloadData()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
       
        navigationItem.title = "Sent Memes"
        
    }

   
    

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
       return memes.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MemeTablecell", for: indexPath) as! TableCell
        // Set the image
        let meme = memes[indexPath.row]
        cell.memeImage?.image = meme.memedImage
        cell.textLabel?.text = meme.bottom + "...." + meme.top
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Grab the DetailVC from Storyboard
        let detailController = self.storyboard!.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        let me = memes[(indexPath as NSIndexPath).row]
        //Populate view controller with data from the selected item
        detailController.memes = me
        navigationController!.pushViewController(detailController, animated: true)
    }

    //MARK: Implemented Delete Row functionality
    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if (editingStyle == UITableViewCellEditingStyle.delete) {
            (UIApplication.shared.delegate as! AppDelegate).memes.remove(at: indexPath.row)
            tableView.reloadData()
           
        }
    }
 

}
