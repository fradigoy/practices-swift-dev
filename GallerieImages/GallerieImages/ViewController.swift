//
//  ViewController.swift
//  GallerieImages
//
//  Created by frederic radigoy on 26/02/2017.
//  Copyright © 2017 frederic radigoy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    var images:[String] = ["lion.png","canyon.png", "concert.png", "esb.png", "sommet.png", "voiture.png"]
    
    
    var index = 1
    
    @IBOutlet weak var Image: UIImageView!
    
    
    @IBAction func ChangerImageAction(_ sender: UIButton) {
        
        
        
        
        if(index == images.count - 1){
            index = 0
        }
        else
        {
           index = index + 1
        }
        let imageStr:String = images[index]
        
        Image.image = UIImage(named:imageStr)
        
    }
    


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    


}

