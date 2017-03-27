//
//  ViewController.swift
//  EggTimer
//
//  Created by frederic radigoy on 24/03/2017.
//  Copyright © 2017 frederic radigoy. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    var pickerInfo:[String] = []
    var tempsCuisson:Int = 0
    var timer:Timer = Timer()
    var lecteur:AVAudioPlayer = AVAudioPlayer()
    var estActif:Bool = false
    
    
    
    //Outlets
    @IBOutlet weak var minuteurLabel: UILabel!
    
    @IBOutlet weak var activerMinuteurBtn: UIButton!
    
    @IBOutlet weak var pViewSelectCuisson: UIPickerView!
    
    //Actions
    @IBAction func activerMinuteurAction(_ sender: UIButton) {
        compteur()
    }
    
    @IBAction func resetMinuteurAction(_ sender: UIButton) {
        resetCompteur()
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pViewSelectCuisson.dataSource = self
        pViewSelectCuisson.delegate = self
        
        pickerInfo = ["Oeufs Durs", "Oeuf à la coque", "Oeufs Mollets", "Les oeufs à la poêle", "Les oeufs au plat", "Les oeufs brouillés", "Les oeufs en omelette", "Les oeufs pochés"]
        
        activerMinuteurBtn.setTitleColor(UIColor.blue, for: UIControlState.normal)
        
        activerMinuteurBtn.isEnabled = false
        activerMinuteurBtn.alpha = 0.3
        
        alarm()
        
        
    }
    
    func selectionCuisson(selection:Int) {
        
        switch selection {
        case 0:
            tempsCuisson = 600
            minuteurLabel.text = minuteurString(temps: tempsCuisson)
            break
        case 1:
            tempsCuisson = 180
            minuteurLabel.text = minuteurString(temps: tempsCuisson)
            break
        case 2:
            tempsCuisson = 360
            minuteurLabel.text = minuteurString(temps: tempsCuisson)
            break
        case 3:
            tempsCuisson = 240
            minuteurLabel.text = minuteurString(temps: tempsCuisson)
            break
        case 4:
            tempsCuisson = 180
            minuteurLabel.text = minuteurString(temps: tempsCuisson)
            break
        case 5:
            tempsCuisson = 180
            minuteurLabel.text = minuteurString(temps: tempsCuisson)
            break
        case 6:
            tempsCuisson = 300
            minuteurLabel.text = minuteurString(temps: tempsCuisson)
            break
        case 7:
            tempsCuisson = 300
            minuteurLabel.text = minuteurString(temps: tempsCuisson)
            break
        default:
            print("Aucune sélection")
            break
        }
        
        activerMinuteurBtn.isEnabled = true
        activerMinuteurBtn.alpha = 1
        
    }
    
    func minuteurString(temps: Int) -> String {
        let heure = Int(temps) / 3600
        let minutes = Int(temps)/60 % 60
        let secondes = Int(temps) % 60
        
        return String(format: "%02i:%02i:%02i", heure, minutes, secondes )
    }
    
    func compteur(){
        
        if(!estActif){
           timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.incrementer), userInfo: nil, repeats: true)
            timer.fire()
            activerMinuteurBtn.setTitle("STOP", for: UIControlState.normal)
            activerMinuteurBtn.setTitleColor(UIColor.orange, for: UIControlState.normal)
            estActif = true
        }
        else
        {
            timer.invalidate()
            activerMinuteurBtn.setTitle("Démarrer", for: UIControlState.normal)
            activerMinuteurBtn.setTitleColor(UIColor.blue, for: UIControlState.normal)
            estActif = false
        }
        
    }
    
    func incrementer(){
    
        if (tempsCuisson == 0)
        {
           timer.invalidate()
            minuteurLabel.text = "00:00:00"
            lecteur.play()
        }
        else{
            tempsCuisson -= 1
            minuteurLabel.text = minuteurString(temps: tempsCuisson)
        }
        
        
        
    
    }
    
    func resetCompteur(){
        timer.invalidate()
        tempsCuisson = 0
        minuteurLabel.text = "00:00:00"
        activerMinuteurBtn.setTitle("Démarrer", for: UIControlState.normal)
        activerMinuteurBtn.setTitleColor(UIColor.blue, for: UIControlState.normal)
        estActif = false
        
        activerMinuteurBtn.isEnabled = false
        activerMinuteurBtn.alpha = 0.3
        
        pViewSelectCuisson.selectRow(0, inComponent: 0, animated: true)
        
    }
    
    //AVAudioPlayer
    
    func alarm(){
        let fichier = Bundle.main.path(forResource: "alarm", ofType: "mp3")
        
        do{
            try lecteur = AVAudioPlayer(contentsOf: URL(string: fichier!)!)
        }
        catch{
            print("erreur lecture fichier MP3")
        }
    }
    
    // Mark - PickerViewDataSource
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int{
        return 1
    }
    
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int{
        return pickerInfo.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerInfo[row]
    }
    
    // Mark - PickerViewDelegate
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectionCuisson(selection: row)
    }
    
    
    
    
}

