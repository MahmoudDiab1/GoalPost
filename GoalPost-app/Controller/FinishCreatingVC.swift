//
//  FinishCreatingVC.swift
//  GoalPost-app
//
//  Created by mahmoud diab on 6/2/20.
//  Copyright © 2020 Diab. All rights reserved.
//

import UIKit

class FinishCreatingVC: UIViewController,UITextFieldDelegate {
    @IBOutlet weak var creatGoalBtn: UIButton!
    var goalDescription:String!
    var goalType:String!
  
    
    
    @IBOutlet weak var pointsTxtField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        creatGoalBtn.bindToKeyboard()
    }
    func configureData (description:String, goalType:GoalType)
    {
        self.goalType = goalType.rawValue
        self.goalDescription = description
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField)
    {
        textField.placeholder = " "
        
    }

    @IBAction func creatGoalPressed(_ sender: UIButton) {
    }
    
}
