//
//  UIViewControllerEx.swift
//  GoalPost-app
//
//  Created by mahmoud diab on 6/2/20.
//  Copyright © 2020 Diab. All rights reserved.
//

import UIKit

extension UIViewController
{
    func presentDetails(_ viewController : UIViewController )
    {
        let transition = CATransition()
        transition.subtype = .fromLeft
        transition.duration = 0.7
        transition.type = .fade
        viewController.modalPresentationStyle = .fullScreen
        
        // TODO:       read next line parts from documentation ( for me )
        self.view.window?.layer.add(transition, forKey: kCATransition)
        present(viewController, animated: false, completion: nil)
    }
    
    func dismissDetails(_ viewController:UIViewController)
    {
        let transition = CATransition()
        transition.subtype = .fromRight
        transition.duration = 0.7
        transition.type = .fade
        viewController.modalPresentationStyle = .fullScreen
        
        // TODO:       read next line parts from documentation ( for me )
        self.view.window?.layer.add(transition, forKey: kCATransition)
        present(viewController, animated: false, completion: nil)
    }
}
