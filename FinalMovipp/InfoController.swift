//
//  InfoController.swift
//  FinalMovipp
//
//  Created by internet on 7/24/15.
//  Copyright (c) 2015 Gualy Vc. All rights reserved.
//

import Foundation
import UIKit

class InfoController: UIViewController {

    @IBOutlet weak var movieLabel: UILabel!
    @IBOutlet weak var languageLabel: UILabel!
    @IBOutlet weak var releaseLabel: UILabel!
    @IBOutlet weak var overviewLabel: UILabel!

    @IBOutlet weak var titulo: UILabel!
    @IBOutlet weak var idioma: UILabel!
    @IBOutlet weak var fecha: UILabel!
    @IBOutlet weak var sinopsis: UILabel!
    
    @IBOutlet weak var posterBack: UIImageView!
    
    @IBOutlet weak var buttonPoster: UIButton!
    
    var received:AnyObject?
    var items = NSMutableArray()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Movie"
        
        //println(received)
        let user:JSON = JSON(self.received!)
        
        movieLabel.text = user["title"].string
        languageLabel.text = user["original_language"].string
        releaseLabel.text = user["release_date"].string
        overviewLabel.text = user["overview"].string

        
        titulo.textColor = UIColor(white: 0.7, alpha: 1.0)
        titulo.font = UIFont(name: MegaTheme.fontName, size: 18)
        idioma.textColor = UIColor(white: 0.7, alpha: 1.0)
        idioma.font = UIFont(name: MegaTheme.fontName, size: 18)
        fecha.textColor = UIColor(white: 0.7, alpha: 1.0)
        fecha.font = UIFont(name: MegaTheme.fontName, size: 18)
        sinopsis.textColor = UIColor(white: 0.7, alpha: 1.0)
        sinopsis.font = UIFont(name: MegaTheme.fontName, size: 18)
        
        languageLabel.textColor = UIColor.whiteColor()
        releaseLabel.textColor = UIColor.whiteColor()
        overviewLabel.textColor = UIColor.whiteColor()
        overviewLabel.font = UIFont(name: MegaTheme.fontName, size: 16)
        
        
        let picURL = user["poster_path"].string
        let url = NSURL(string: "http://image.tmdb.org/t/p/w500" + picURL!)
        
        let data = NSData(contentsOfURL: url!)

        posterBack.image = UIImage(data: data!)
        
        
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if(segue.identifier == "posterFull"){
            
            let secondVC = segue.destinationViewController as! PosterController
            secondVC.received2 = received
            
        }
    }
    
   
}