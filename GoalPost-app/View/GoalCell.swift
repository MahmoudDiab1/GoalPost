//
//  GoalCell.swift
//  GoalPost-app
//
//  Created by mahmoud diab on 6/2/20.
//  Copyright © 2020 Diab. All rights reserved.
//

import UIKit

class GoalCell: UITableViewCell {

    @IBOutlet weak var goalDescription: UILabel!
    @IBOutlet weak var goalType: UILabel!
    @IBOutlet weak var goalProgress: UILabel!
    
    
    
    func congigureGoalCell(goal: Goal)
    {
        self.goalType.text = goal.goalType
        self.goalDescription.text = goal.goalDescription
        self.goalProgress.text =  String(goal.goalProgress)
    }
    
}
