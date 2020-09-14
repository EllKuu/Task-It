//
//  DetailViewController.swift
//  Task-It
//
//  Created by elliott kung on 2020-09-09.
//  Copyright © 2020 elliott kung. All rights reserved.
//

import UIKit
import CoreData

class DetailViewController: UIViewController {

    var dayOfWeek = ""
    var tableView = UITableView()
    var tasks:[Task]?
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
   
    struct Cells{
           static let taskCell = "TaskTableViewCell"
       }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .darkGray
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addTask))
       
        configureTableView()
        fetchTasks()
        
    }
    
    @objc func addTask(){
        let day = DayOfTheWeek(context: context)
        day.dayName = dayOfWeek
        print("DAYNAME: \(day)")
        
        // create task
        let alert = UIAlertController(title: "Add Task", message: "", preferredStyle: .alert)
        alert.addTextField()
        
        let submitButton = UIAlertAction(title: "Add", style: .default) { (action) in
            let textfield = alert.textFields![0]
            
            let newTask = Task(context: self.context)
            newTask.taskName = textfield.text
            newTask.dayName = day
            
            do{
                try self.context.save()
            }catch{
                
            }
            
            self.fetchTasks()
            
        }
        
        alert.addAction(submitButton)
        self.present(alert, animated: true, completion: nil)
    }
    
    func fetchTasks(){
        do{
            self.tasks = try context.fetch(Task.fetchRequest()).filter({ (task) -> Bool in
                task.dayName?.dayName == "\(dayOfWeek)"
            })
            
            DispatchQueue.main.async{
                self.tableView.reloadData()
            }
            
        }catch{
            
        }
        
    }
    
    func configureTableView(){
        view.addSubview(tableView)
        // set delegates
        tableView.delegate = self
        tableView.dataSource = self
        
        // set row height
        tableView.rowHeight = 100
        
        // register cells
        tableView.register(TaskTableViewCell.self, forCellReuseIdentifier: Cells.taskCell)
        
        // set constraints
        tableView.pin(to: view)
    }
    

  

}

extension DetailViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.tasks?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TaskTableViewCell", for: indexPath)
        let task = self.tasks?[indexPath.row]
        cell.textLabel?.text = task?.taskName
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let task = self.tasks![indexPath.row]
        
        let alert = UIAlertController(title: "Edit Task", message: "", preferredStyle: .alert)
        alert.addTextField()
        
        let textField = alert.textFields![0]
        textField.text = task.taskName
        
        let saveBtn = UIAlertAction(title: "Save", style: .default) { (action) in
            let textField = alert.textFields![0]
            
            task.taskName = textField.text
            
            do{
                try self.context.save()
            }catch{
                
            }
            
            self.fetchTasks()
        }
        
        alert.addAction(saveBtn)
        self.present(alert, animated: true, completion: nil)
        
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let action = UIContextualAction(style: .destructive, title: "Delete") { (action, view, completionHandler) in
            
            let personToRemove = self.tasks![indexPath.row]
            
            self.context.delete(personToRemove)
            
            do{
                try self.context.save()
            }catch{
                
            }
            
            self.fetchTasks()
        }
        return UISwipeActionsConfiguration(actions: [action])
    }
    
      
  } // end of detailVC
