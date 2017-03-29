//
//  ViewController.swift
//  ToDoList
//
//  Created by frederic radigoy on 29/03/2017.
//  Copyright © 2017 frederic radigoy. All rights reserved.
//

import UIKit


protocol TodosViewControllerDelegate : class {
    
    func TodoAjouter(sender: ViewController, todo:String)
    
    
    
}

class ViewController: UIViewController {
    
    var delegate: TodosViewControllerDelegate?

    
    @IBOutlet weak var todoTextField: UITextField!
    
    @IBAction func annulerAjouterTodo(_ sender: UIBarButtonItem) {
        
        
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func AjouterTodoAction(_ sender: UIBarButtonItem) {
        //print("todo ajouté\("todoTextField.text!")
        
        
        delegate?.TodoAjouter(sender: self, todo: todoTextField.text!)
        
       // todos.append(todoTextField.text!)
        
        
        self.dismiss(animated: true, completion: nil)
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

