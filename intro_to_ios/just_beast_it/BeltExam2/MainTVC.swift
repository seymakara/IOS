//
//  ViewController.swift
//  BeltExam2
//
//  Created by Seyma Akin on 1/30/18.
//  Copyright © 2018 Seyma Akin. All rights reserved.
//

import UIKit
import CoreData

class MainTVC: UITableViewController, AddItemTVCDelegate, ItemCustomCellDelegate {
    
    

    @IBOutlet var mainTable: UITableView!
    
    var beasted = [Items]()
    var notBeasted = [Items]()
    
     let managedObjectContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext 
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        performSegue(withIdentifier: "addItemSegue", sender: self)
    }
    
   
    func editCell(sender: ItemCustomCellTVC) {
        let indexPath = mainTable.indexPath(for: sender)! as IndexPath
        let notBeastedItem = notBeasted[indexPath.row]
        notBeastedItem.beasted = true
        
        do {
            try managedObjectContext.save()
        } catch {
            print(error)
        }
        print(beasted)
        
        fetchAllData()
        tableView.reloadData()
    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let navigationController = segue.destination as! UINavigationController
        let destination = navigationController.topViewController as! AddItemTVC
        
        destination.delegate = self
        
        if ((sender as? IndexPath) != nil){
            let indexPath = sender as! IndexPath
            let item = notBeasted[indexPath.row]
            destination.titleField = item.title
            destination.indexPath = indexPath
        }
    }
    
    func fetchAllData() {
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Items")
        
        do {
            // populate incomplete list
            request.predicate = NSPredicate(format: "beasted = %@", NSNumber(value: false))
            notBeasted = try managedObjectContext.fetch(request) as! [Items]
        
            request.predicate = NSPredicate(format: "beasted = %@", NSNumber(value: true))
            beasted = try managedObjectContext.fetch(request) as! [Items]
            
        } catch {
            print(error)
        }
        
    }
    
    func saveItem(by: AddItemTVC, title: String, indexPath: IndexPath?) {
        
        if let ip = indexPath{
            let item = notBeasted[ip.row]
            item.title = title
        }
        
        else{
            let item = NSEntityDescription.insertNewObject(forEntityName: "Items", into: managedObjectContext) as! Items
        
    
            
            let date  = Date()

            item.beasted = false
            item.title = title
            item.time = date
            notBeasted.append(item)
        }
        
        do {
            try managedObjectContext.save()
        }
        catch {
            print(error)
        }
        
        mainTable.reloadData()
        dismiss(animated: true, completion: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchAllData()
        mainTable.delegate = self
        mainTable.dataSource = self
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
       
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath) as! ItemCustomCellTVC
         cell.delegate = self
        
        cell.titleLabel.text = notBeasted[indexPath.row].title
        
        return cell
        
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notBeasted.count
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        let item = notBeasted[indexPath.row]
        managedObjectContext.delete(item)
        notBeasted.remove(at: indexPath.row)
        
        do {
            try managedObjectContext.save()
        } catch {
            print ("\(error)")
        }
        
        tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        performSegue(withIdentifier: "addItemSegue", sender: indexPath)
    }


}

