//
//  ViewController.swift
//  userDefaults
//
//  Created by frederic radigoy on 29/03/2017.
//  Copyright © 2017 frederic radigoy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // declaration infos / données
        let nom = "frederic"
        let age = 31
        
        // creation instance de UserDefault
        let defaults = UserDefaults.standard
        
        
        // definition des préférences
        defaults.set(nom, forKey: "nom")
        defaults.set(age, forKey: "age")
        
        
        //retrouver les préférences
        let monNom = defaults.object(forKey: "nom")
        let monAge = defaults.object(forKey: "age")
        
        
        print("mon nom est \(monNom!) et j'ai \(monAge!)")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

