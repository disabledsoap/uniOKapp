//
//  TaskTableViewController.swift
//  qwerty5
//
//  Created by Арсений on 20.03.2020.
//  Copyright © 2020 Арсений. All rights reserved.
//
import os.log
import UIKit

class TaskTableViewController: UITableViewController {
    
    let loadDefaults = UserDefaults.standard

    
    var tasks = [Task]()
    var my_set = UserDefaults.standard
    
    @IBOutlet var myTableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
    
      /*  var my_d = ["12.04.2020": "red", "15.04.2020" : "blue"]
        //my_set.setPersistentDomain(my_d, forName: "Calendar")
        my_set.set(my_d, forKey: "Calenar")
        
        my_d.updateValue("green", forKey: "26.07.2020")
        
        
        print("Get duct", my_set.object(forKey: "Calenar") ?? "Some error!!")
        
        for (k, v) in my_d {
            if k == "26.07.2020" {
                print("Your color is", v)
            }
            
            if k == "01.02.2020" {
                
            }
            
            
            print("All dates and colors", k, v)
            
        }
        
        switch v  {
        case "red":
            print("RED")
        default:
            break
        }*/
        
        if let load = loadDefaults.string(forKey: "savename") {
            print("Save name", load)
        } else {
           performSegue(withIdentifier: "firstVC", sender: self)
        }
        
       
        
        
        // Use the edit button item provided by the table view controller.
        navigationItem.leftBarButtonItem = editButtonItem
    
        // Load any saved tasks, otherwise load sample data.
        if let savedTasks = loadTasks() {
            tasks += savedTasks
        }
        else {
            // Load the sample data.
            loadSampleTasks()
        }
        
        sortTasks()

       
    }
   
   
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return tasks.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // Table view cells are reused and should be dequeued using a cell identifier.
        let cellIdentifier = "myCell"
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? TaskTableViewCell  else {
            fatalError("The dequeued cell is not an instance of TaskTableViewCell.")
        }
        
        // Fetches the appropriate meal for the data source layout.
        let task = tasks[indexPath.row]
        
        cell.namelabel.text = task.name
        cell.photoImageView.image = task.photo
        cell.startLabel.text = task.start
        cell.finishLabel.text = task.finish
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.alpha = 0
        UIView.animate(withDuration: 1) {
            cell.alpha = 1
        }
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tasks.remove(at: indexPath.row)
            saveTasks()
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    
    
    
    //MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        super.prepare(for: segue, sender: sender)
        
        switch(segue.identifier ?? "") {
            
        case "AddItem":
            os_log("Adding a new task.", log: OSLog.default, type: .debug)
        case "ShowDetail":
            guard let taskDetailViewController = segue.destination as? TaskViewController else {
                fatalError("Unexpected destination: \(segue.destination)")
            }
            
            guard let selectedTaskCell = sender as? TaskTableViewCell else {
                fatalError("Unexpected sender: \(sender)")
            }
            
            guard let indexPath = tableView.indexPath(for: selectedTaskCell) else {
                fatalError("The selected cell is not being displayed by the table")
            }
            
            let selectedTask = tasks[indexPath.row]
            taskDetailViewController.task = selectedTask
        default:
           // fatalError("Unexpected Segue Identifier; \(segue.identifier)")
            print()
        }
    }
    
    
    @IBAction func unwindToTaskList(sender: UIStoryboardSegue) {
        if let sourceViewController = sender.source as? TaskViewController, let task = sourceViewController.task {
            
            if let selectedIndexPath = tableView.indexPathForSelectedRow {
                // Update an existing task.
                tasks[selectedIndexPath.row] = task
                tableView.reloadRows(at: [selectedIndexPath], with: .none)
            }
            else {
                // Add a new task.
                let newIndexPath = IndexPath(row: tasks.count, section: 0)
                
                tasks.append(task)
                tableView.insertRows(at: [newIndexPath], with: .automatic)
            }
            // Save the tasks.
            saveTasks()
        }
    }
    
    
    
    
    
    
    
    //MARK: Private Methods
    
    private func loadSampleTasks() {
        let photo1 = UIImage(named: "pusheenCook")
        let photo2 = UIImage(named: "pusheenPasear")
        let photo3 = UIImage(named: "pusheenRead")
        
        guard let task1 = Task(name: "Caprese Salad", photo: photo1, start: "19.02", finish: "20.02") else {
            fatalError("Unable to instantiate task1")
        }
        
        guard let task2 = Task(name: "Chicken and Potatoes", photo: photo2, start: "19.03", finish: "20.03") else {
            fatalError("Unable to instantiate task2")
        }
        
        guard let task3 = Task(name: "Pasta with Meatballs", photo: photo3, start: "19.04", finish: "20.04") else {
            fatalError("Unable to instantiate task2")
        }
        tasks += [task1, task2, task3]
    }
    private func saveTasks() {
        let isSuccessfulSave = NSKeyedArchiver.archiveRootObject(tasks, toFile: Task.ArchiveURL.path)
        if isSuccessfulSave {
            os_log("Tasks successfully saved.", log: OSLog.default, type: .debug)
        } else {
            os_log("Failed to save tasks...", log: OSLog.default, type: .error)
        }
    }
    
    private func loadTasks() -> [Task]?  {
        return NSKeyedUnarchiver.unarchiveObject(withFile: Task.ArchiveURL.path) as? [Task]
    }
    
    private func sortTasks() {
        self.tasks.sort(by: { $0.start.compare($1.start) == .orderedDescending})
        }

}
