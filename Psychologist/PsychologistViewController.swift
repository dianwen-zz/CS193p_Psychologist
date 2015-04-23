//
//  ViewController.swift
//  Psychologist
//
//  Created by Dan Li  on 4/21/15.
//  Copyright (c) 2015 Dan Li . All rights reserved.
//

import UIKit

class PsychologistViewController: UIViewController {

    @IBAction func nothing(sender: UIButton) { // Performing segue in code. The segue is linked in the storyboard through ctrl dragging from master's ViewController to the detail's navigation controller
        performSegueWithIdentifier("nothing", sender: nil)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        var destination = segue.destinationViewController as? UIViewController
        if let navCon = destination as? UINavigationController {
            destination = navCon.visibleViewController
        }
        
        if let hvc = destination as? HappinessViewController {
            if let identifier = segue.identifier {
                switch identifier {
                case "sad": hvc.happiness = 0
                case "happy": hvc.happiness = 100
                case "nothing": hvc.happiness = 25 // Still gets a chance to prepare segue
                default: hvc.happiness = 50
                }
            }
        }
    }

}

