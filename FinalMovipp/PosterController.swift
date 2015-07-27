//
//  posterController.swift
//  FinalMovipp
//
//  Created by internet on 7/26/15.
//  Copyright (c) 2015 Gualy Vc. All rights reserved.
//

import Foundation
import UIKit

class PosterController: UIViewController {
    
    @IBOutlet weak var posterWall: UIImageView!
    
    var received2:AnyObject?
    var items = NSMutableArray()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Poster"
        //println(received)
        let user:JSON = JSON(self.received2!)
        
        let picURL = user["poster_path"].string
        let url = NSURL(string: "http://image.tmdb.org/t/p/w500" + picURL!)
        
        let data = NSData(contentsOfURL: url!)
        
        posterWall.image = UIImage(data: data!)
        
    }
    
}