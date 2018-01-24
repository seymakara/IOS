//
//  ViewController.swift
//  todoList
//
//  Created by Seyma Akin on 1/23/18.
//  Copyright © 2018 Seyma Akin. All rights reserved.
//

import UIKit
import CoreData

class MainViewController: UITableViewController, AddItemButtonDelegate {
    
    var tasks = [TodoListItem]()
    let managedObjectContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    override func viewDidLoad() {
        super.viewDidLoad()
        fetchAllItems()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell", for: indexPath) as! CustomCelll
        if tasks.count != 0{
            
            cell.TitleLabel.text = tasks[indexPath.row].title
            print("TITLE\(tasks[indexPath.row].title)")
            
            let formatter = DateFormatter()
            formatter.dateFormat = "dd.MM.yyyy"
            cell.DateLabel.text = formatter.string(from: tasks[indexPath.row].date!)
            
            
            cell.DetailLabel.text = tasks[indexPath.row].detail
            
        
            print("CHECK\(tasks[indexPath.row].check)")
            if tasks[indexPath.row].check == true{
                cell.accessoryType = .checkmark
            }

        }
            
        return cell
    }
    
    
    func fetchAllItems(){
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "TodoListItem")
        do{
            let result = try managedObjectContext.fetch(request)
            tasks = result as! [TodoListItem]
        }
        catch{
            print("\(error)")
        }
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let task = tasks[indexPath.row]
        task.check = true
        
        do{
            try managedObjectContext.save()
        }
        catch{
            print("\(error)")
        }
        tableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let AddViewController = segue.destination as! AddViewController
        AddViewController.delegate = self
    }
    
    func AddButtonPressed(by controller: AddViewController, with title: String, with detail: String, with date: Date) {
        
        let task = NSEntityDescription.insertNewObject(forEntityName: "TodoListItem", into: managedObjectContext) as! TodoListItem
        task.title = title
        print("TITLE2\(title)")
        task.detail = detail
        task.date = date
        task.check = false
        tasks.append(task)
        
        do{
            try managedObjectContext.save()
        }
        catch{
            print("\(error)")
        }
        dismiss(animated: true, completion: nil)
        tableView.reloadData()
        
    }    

}


