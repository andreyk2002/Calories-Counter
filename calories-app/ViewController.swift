//
//  ViewController.swift
//  calories-app
//
//  Created by Andrey Kuksa on 4/16/21.
//

import UIKit
import SwiftUI

class ViewController: UIViewController {

    @IBOutlet weak var AgeField: UITextField!
    
    
    @IBOutlet weak var HeightField: UITextField!
    
    
    @IBOutlet weak var WeightField: UITextField!
    
    @IBOutlet weak var SexControl: UISegmentedControl!
    
    @IBOutlet weak var ResultLabel: UILabel!
    
    @IBOutlet weak var TrainingsControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func countTapped(_ sender: Any) {
        
        let age :Int = (AgeField.text as! NSString).integerValue
        let weight:Int = (WeightField.text as! NSString).integerValue
        let height:Int = (HeightField.text as! NSString).integerValue
        
        let massIndex = Double(weight * 10000) / Double(height * height)
        
        var amr:Double
        let activity = TrainingsControl.selectedSegmentIndex
        switch activity {
        case 0:
            amr = 1.2
        case 1:
            amr = 1.375
        case 2:
            amr = 1.55
        case 3:
            amr = 1.725
        default:
            amr = -1
        }
        
        let state = SexControl.selectedSegmentIndex
        var calories:Double
        if state == 0 {
          var bmr = 88.362
            bmr += 13.397 * Double(weight)
            bmr += 4.799 *  Double(height)
            bmr -= 5.677 * Double(age)
            calories = bmr * amr
        } else {
            var bmr = 444.593
            bmr += 9.247 * Double(weight)
            bmr += 3.098 * Double(height)
            bmr -= 4.330 * Double(age)
            calories = bmr * amr
        }
        
        ResultLabel.text = "Your daily basic is \(calories). Mass index = \(massIndex)"
    }
    
}
