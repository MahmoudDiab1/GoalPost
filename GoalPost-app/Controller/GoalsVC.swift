//
//  ViewController.swift
//  GoalPost-app
//
//  Created by mahmoud diab on 6/1/20.
//  Copyright © 2020 Diab. All rights reserved.
//

import UIKit
import CoreData


let appDelegate = UIApplication.shared.delegate as? AppDelegate

class GoalsVC: UIViewController {
    
    @IBOutlet weak var goalRemovedView: UIView!
    @IBOutlet weak var goalsTableView: UITableView!
    var goals:[Goal]=[]
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
       fetchCoreDataObjects()
        goalsTableView.reloadData()
    }
    
    func fetchCoreDataObjects ()
    {
        fetch { (complete) in
                   if complete == true
                   {
                       if goals.count>=1
                       {
                           goalsTableView.isHidden=false
                       }
                       else
                       {
                           goalsTableView.isHidden = true
                       }
                   }
                   
               }
               
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        goalsTableView.dataSource = self
        goalsTableView.delegate = self
        goalsTableView.isHidden = false
        
    }
    
    @IBAction func addGoalPressed(_ sender: Any) {
        
        guard  let vc = storyboard?.instantiateViewController(identifier: "CreatGoalVC")
            else { return }
        
        presentDetails(vc)
    }
  
}


extension GoalsVC:UITableViewDelegate, UITableViewDataSource
{
    
      func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "goalCellID") as! GoalCell
        cell.congigureGoalCell(goal: goals[indexPath.row])
        return cell
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return goals.count
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        let style = UITableViewCell.EditingStyle.none
        return style
    }
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title: "DELETE") { (action, view, handler) in
            self.deleteGoal(at: indexPath)
            self.fetchCoreDataObjects()
            tableView.deleteRows(at: [indexPath], with: .automatic)
           
        }
         deleteAction.backgroundColor = .red
        let configuration = UISwipeActionsConfiguration(actions: [deleteAction])
        configuration.performsFirstActionWithFullSwipe = false
        return configuration
    }
    
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let addProgress = UIContextualAction(style: .normal, title: "increse progress") { (action, view, handeler) in
            self.addProgress(atGoal: indexPath)
            tableView.reloadRows(at: [indexPath], with: .automatic)
            
        }
       addProgress.backgroundColor = .blue
        let configuration = UISwipeActionsConfiguration(actions: [addProgress])
        configuration.performsFirstActionWithFullSwipe = false
        return configuration
    }
      
}

extension GoalsVC
{
    
    func addProgress (atGoal indexPath : IndexPath)
    
    {
        let managedContext = appDelegate?.persistentContainer.viewContext
       
        if goals[indexPath.row].goalProgress < goals[indexPath.row].goalCompletionValue
        {
            goals[indexPath.row].goalProgress += 1
        }
        else
        {
            return
            
        }
        do { try managedContext?.save()}
        catch
        { print("can't set progress\(error.localizedDescription)") ; return }
        
    }
    func fetch (completion : (_ complete:Bool)->Void)
    {
        let managedContext = appDelegate?.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<Goal>(entityName: "Goal")
        do
        {
            if let goals = try managedContext?.fetch(fetchRequest)
            {
                self.goals = goals
                completion(true)
            }
            
        }
        catch {  completion(false)
            debugPrint(error.localizedDescription)
        }
    }
    
    func deleteGoal (at indexPath:IndexPath)
    {
        let managedContext = appDelegate?.persistentContainer.viewContext
        managedContext?.delete(goals[indexPath.row])
         
       
        do {
            try  managedContext?.save()
          } catch {
            
            debugPrint(error.localizedDescription)
        }
    }
    

}
