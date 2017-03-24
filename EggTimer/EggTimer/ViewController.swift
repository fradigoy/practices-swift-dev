//
//  ViewController.swift
//  EggTimer
//
//  Created by frederic radigoy on 24/03/2017.
//  Copyright © 2017 frederic radigoy. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    var pickerInfo:[String] = []
    var tempsCuisson:Int = 0
    var timer:Timer = Timer()
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
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pViewSelectCuisson.dataSource = self
        pViewSelectCuisson.delegate = self
        
        pickerInfo = ["Oeufs Durs", "Oeuf à la coque", "Oeufs Mollets", "Les oeufs à la poêle", "Les oeufs au plat", "Les oeufs brouillés", "Les oeufs en omelette", "Les oeufs pochés"]
        
        
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
            estActif = true
        }
        else
        {
            timer.invalidate()
            estActif = false
        }
        
    }
    
    func incrementer(){
    
        tempsCuisson -= 1
        minuteurLabel.text = minuteurString(temps: tempsCuisson)
    
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

