//
//  ViewController.swift
//  ControllerNavigation
//
//  Created by frederic radigoy on 29/03/2017.
//  Copyright © 2017 frederic radigoy. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    
    var data = ["texte 1", "texte 2", "texte 3"]

    @IBOutlet weak var TableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        TableView.dataSource = self
        
    }


    // MARK - UITableViewDatasource
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return data.count
    }
    
    
    // Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
    // Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        
        let cell = TableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text =  data[indexPath.row]
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "voirDetails"){
            
            let index = TableView.indexPathForSelectedRow
            let cellSelected = data[(index?.row)!]
            
            let destinationVC = segue.destination as! SecondViewController
            
            destinationVC.text = cellSelected
            
        }
    }


}

