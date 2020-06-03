//
//  CreatGoalVC.swift
//  GoalPost-app
//
//  Created by mahmoud diab on 6/2/20.
//  Copyright © 2020 Diab. All rights reserved.
//

import UIKit

class CreatGoalVC: UIViewController, UITextViewDelegate {

    @IBOutlet weak var goalDescription: UITextView!
    @IBOutlet weak var longTermBtn: UIButton!
    @IBOutlet weak var shorTermBtn: UIButton!
    @IBOutlet weak var nextBtn: UIButton!
    @IBOutlet weak var backBtn: UIButton!
    var goalType:GoalType?
    override func viewDidLoad() {
        super.viewDidLoad()
         goalDescription.delegate=self
         goalType = .longTerm
         longTermBtn.setSelectedColor()
         shorTermBtn.setDeselectedColor()
         nextBtn.bindToKeyboard()
    }
    func textViewDidBeginEditing(_ textView: UITextView) {
        textView.text = ""
        textView.textColor = .black
        
    }
    @IBAction func longTermpressed(_ sender: UIButton) {
        goalType = .longTerm
        longTermBtn.setSelectedColor()
        shorTermBtn.setDeselectedColor()
    }
    @IBAction func shortTermPressed(_ sender: UIButton) {
        goalType = .shortTerm
        longTermBtn.setDeselectedColor()
        shorTermBtn.setSelectedColor()
    }
    
    @IBAction func nextPressed(_ sender: UIButton) {
        
        if goalDescription.text != "" && goalDescription.text != "WHAT IS YOUR GOAL ?"
        {
        guard let Vc = storyboard?.instantiateViewController(identifier: "FinishCreatingVC") as? FinishCreatingVC
            else {return}
            Vc.configureData(description: goalDescription.text , goalType: goalType!)
            dismissDetails(Vc)
            
        }
        
    }
    @IBAction func backPressed(_ sender: UIButton) {
       guard  let vc = storyboard?.instantiateViewController(identifier: "GoalsVC")
       else { return }
     dismissDetails(vc)
    }
}
