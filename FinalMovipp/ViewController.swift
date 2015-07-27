//
//  ViewController.swift
//  FinalMovipp
//
//  Created by internet on 7/23/15.
//  Copyright (c) 2015 Gualy Vc. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    @IBOutlet var collectionView : UICollectionView!
    @IBOutlet var layout : UICollectionViewFlowLayout!
    
    var cellHeight : CGFloat = 240
    var items = NSMutableArray()
    
       
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Movipp"
        self.navigationController!.navigationBar.barTintColor = UIColor(red: 0.1, green: 0.1, blue: 0.5, alpha: 0.1)
        self.navigationController!.navigationBar.tintColor = UIColor.lightGrayColor()
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = UIColor.clearColor()
        
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        
        let cellWidth = calcCellWidth(self.view.frame.size)
        layout.itemSize = CGSizeMake(cellWidth, cellHeight)
        
        getData()
    }
    
    
    func getData() {
        RestApiManager.sharedInstance.getRandomUser { json -> Void in
        
            let results = json["results"]
            for (index: String, subJson: JSON) in results {
            let user: AnyObject = subJson.object
            
            self.items.addObject(user)
            dispatch_async(dispatch_get_main_queue(), {
                 self.collectionView.reloadData()
            })
            }
        
      }
    }
    
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("MovieCell", forIndexPath: indexPath) as! MovieCell
        

        let user:JSON = JSON(self.items[indexPath.row])
        
        let picURL = user["poster_path"].string
        let url = NSURL(string: "http://image.tmdb.org/t/p/w500" + picURL!)
        
        let data = NSData(contentsOfURL: url!)
        
    
        cell.titleLabel.text = user["title"].string
        cell.nameLabel.text = user["release_date"].string
        cell.coverImageView.image = UIImage(data: data!)
     

        return cell
    }

    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
        performSegueWithIdentifier("infoMovies", sender: self)
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if(segue.identifier == "infoMovies"){
            
            let selectedItems = collectionView.indexPathsForSelectedItems()
            
            let selectedIndexPath = selectedItems[0] as! NSIndexPath
            let user: AnyObject = items[selectedIndexPath.row]
            
            let secondVC = segue.destinationViewController as! InfoController
            secondVC.received = user
        
        }
    }
    
    
    override func viewWillTransitionToSize(size: CGSize, withTransitionCoordinator coordinator: UIViewControllerTransitionCoordinator) {
        
        var cellWidth = calcCellWidth(size)
        layout.itemSize = CGSizeMake(cellWidth, cellHeight)
    }
    
    
    func calcCellWidth(size: CGSize) -> CGFloat {
        let transitionToWide = size.width > size.height
        var cellWidth = size.width / 2
        
        if transitionToWide {
            cellWidth = size.width / 3
        }
        
        return cellWidth
    }
    
}

