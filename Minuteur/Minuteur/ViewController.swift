//
//  ViewController.swift
//  Minuteur
//
//  Created by frederic radigoy on 23/03/2017.
//  Copyright © 2017 frederic radigoy. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var compteur:Timer?
    var compte:Int = 0
    var lecteur:AVAudioPlayer = AVAudioPlayer()
    

    @IBOutlet weak var compteurLabel: UILabel!
    
    @IBAction func stopTimerAction(_ sender: Any) {
        
        
        compteur?.invalidate()
        compte = 0
        compteurLabel.text = "00:00"
        
        compteurLabel.textColor = UIColor.black
        
        lecteur.stop()
        jouerSon(son: "bip")
        
    }
    
    @IBAction func pauseTimerAction(_ sender: Any) {
        
        compteur?.invalidate()
        lecteur.pause()
    }
    
    @IBAction func demarrerTimerAction(_ sender: Any) {
        
        compteur = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.incrementerCompteur), userInfo: nil, repeats: true)
        
        
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        compteur = Timer()
        
        jouerSon(son: "bip")

    

    }
    
    func jouerSon(son:String){
        
          let fichierSon = Bundle.main.path(forResource: son, ofType: "mp3")
        
        do {
            try lecteur = AVAudioPlayer(contentsOf: URL(string: fichierSon!)!)
        }
        catch{
            print("erreur fichier son")
        }
        
    }
    
    func incrementerCompteur() {


        
        // Lecteur
        
        lecteur.play()
        
        let limite = 12
        
        if(limite == compte){
            jouerSon(son:  "alarm")
            lecteur.play()
            
            compteurLabel.textColor = UIColor.green
            
        }
        else if(limite -  compte < 3){
            compteurLabel.textColor = UIColor.red
           
            lecteur.play()
             compte += 1
        }
        else
        {
            
            compte += 1
            lecteur.play()
        }
        
    
        // formatage minute, seconde
        let minutes = compte / 60 % 60
        let secondes = compte % 60
        
        let timeStr = String(format: "%02i:%02i", minutes, secondes)
        
        compteurLabel.text = timeStr
        
        
        
    }

}

