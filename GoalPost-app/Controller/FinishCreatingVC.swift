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
    @IBOutlet weak var goalPointsTxtField: UITextField!
    
    var goalDescription:String?
    var goalType:String!
    var goalPoints:Int32!
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
    @IBAction func creatBtnPressed(_ sender: UIButton) {
        guard let goalPointsInt = Int32(goalPointsTxtField.text!) else { return }
        goalPoints = goalPointsInt
        save { (completed) in
            if completed == true
            {
                    let vc = self.storyboard?.instantiateViewController(identifier: "CreatGoalVC")as? CreatGoalVC
                presentingViewController?.dismissAndPresent(viewControllerToPresent: vc!)
                
            }
            
        }
    }
    @IBAction func backBtnPressed(_ sender: Any) {
        
    }
    
    func save (completion:(_ finished:Bool)->())
    {
        
        guard let goalPoints = goalPoints else {return}
        guard let managedContext = appDelegate?.persistentContainer.viewContext else { return }
        let goal = Goal(context: managedContext)
        goal.goalDescription = goalDescription
        goal.goalCompletionValue = goalPoints
        goal.goalType = goalType
        goal.goalProgress = 0
        print("sa")
        do
        {
            try managedContext.save()
            completion(true)
            
        }
        catch {
            //         handle error
            
            completion(false)
        }
        
    }
    
}
