//
//  ViewController.swift
//  DemoCoreData
//
//  Created by frederic radigoy on 31/03/2017.
//  Copyright © 2017 frederic radigoy. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    
    var context:NSManagedObjectContext?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        // demo Todo
        
        for i in 1...5{
        
            //creation NSManagedObjecty
            let nouveauTodo = NSEntityDescription.insertNewObject(forEntityName: "Todo", into: context!)
            
            creerTodo(objet: nouveauTodo, texte: "tache \(i)", date: Date())
        
        }
        
    }
    
    
    
    
    func creerTodo(objet: NSManagedObject, texte:String, date:Date){
        
        //definir valeurs pour chaque attribut
        objet.setValue("todo 1", forKey: "texte")
        objet.setValue(Date(), forKey: "date")
        
        
        // sauvegarde NSManagedObjecty
        
        do{
            try context?.save()
            print("\(objet) sauvegardé dans Model avec succès")
        }
        catch{
            print("erreur sauvegader CoreData")
        }
        
    }
    
    
    func lireTodo(completion:(_ array:NSArray)->()){
        let requete:NSFetchRequest<NSFetchRequestResult> = NSFetchRequest(entityName: "Todo")
        var todosArray:NSArray?
        
        do {
            let results = try context?.fetch(requete)
            
            for result in results!{
                
                let todo = (result as! NSManagedObject).value(forKey: "texte") as? String
                let date = (result as! NSManagedObject).value(forKey: "date")  as? Date
            }
            
            
        } catch  {
            print("erreur requete CoreData")
        }
    }


}

