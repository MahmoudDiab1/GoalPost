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

    @IBOutlet weak var goalsTableView: UITableView!
    
    
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


extension UIViewController:UITableViewDelegate, UITableViewDataSource
{
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       guard let cell = tableView.dequeueReusableCell(withIdentifier: "goalCellID") as? GoalCell
        else
        {
            return GoalCell ()
        }
        cell.congigureGoalCell(goalDescription: "Solve problems at hackerrank for 3 days.Solve problems at hackerrank for 3 days.Solve problems at hackerrank for 3 day.", goalType: .longTerm, goalPoints: 5)
               return cell
    }
    
    
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
}
