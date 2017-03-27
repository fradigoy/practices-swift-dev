//
//  ViewController.swift
//  tipCalculor
//
//  Created by frederic radigoy on 27/03/2017.
//  Copyright © 2017 frederic radigoy. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    var pourcentagePourBoire:Float?
    
    @IBOutlet weak var montantFactureTextField: UITextField!
    
    @IBOutlet weak var pourBoireSegmentControl: UISegmentedControl!
    
    @IBOutlet weak var pourBoireLabel: UILabel!
    @IBOutlet weak var montantTotalLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        pourBoireSegmentControl.addTarget(self, action: #selector(ViewController.calculerPourCentage), for: UIControlEvents.valueChanged)
        
        montantFactureTextField.delegate = self
        montantFactureTextField.becomeFirstResponder()
    }

    // Functions
    
    
    
    func calculerPourCentage(){
        
        switch pourBoireSegmentControl.selectedSegmentIndex {
        case 0:
            print("segment sélectionné: \(pourBoireSegmentControl.selectedSegmentIndex)")
            pourcentagePourBoire = 15
            break
        case 1:
            print("segment sélectionné: \(pourBoireSegmentControl.selectedSegmentIndex)")
            pourcentagePourBoire = 20
            break
        case 2:
            print("segment sélectionné: \(pourBoireSegmentControl.selectedSegmentIndex)")
            pourcentagePourBoire = 25
            break

        default:
            print("Pas de sélection")
        }
        calculerPourBoire(pourcent: Float(pourcentagePourBoire!))
    }
    
    func calculerPourBoire(pourcent:Float){
        let pourBoire = Float(montantFactureTextField.text!)! * pourcent / 100
        
        let montant = Float(montantFactureTextField.text!)
        let pourBoireFormatString = NSString(format: "%.2f", pourBoire)
        let montantTotalFormatStr = NSString(format: "%.2f", pourBoire + montant!)
        
        pourBoireLabel.text = "€  \(pourBoireFormatString)"
        montantTotalLabel.text = "€  \(montantTotalFormatStr)"
    }
    
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        montantFactureTextField.text = ""
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    


}

