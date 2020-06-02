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
    
    
    
    func congigureGoalCell(goalDescription:String, goalType:GoalType, goalProgress:Int)
    {
        self.goalType.text = goalType.rawValue
        self.goalDescription.text = goalDescription
        self.goalProgress.text = String(goalProgress)
    }
    
}
