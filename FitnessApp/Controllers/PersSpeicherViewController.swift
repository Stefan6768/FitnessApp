//
//  PersSpeicherViewController.swift
//  FitnessApp
//
//  Created by Stefan Schreiber on 22.01.23.
//

import UIKit

class PersSpeicherViewController: UIViewController {
    
    var user: User!
    
    @IBOutlet weak var nameLabel: UILabel!

    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    override func viewDidLoad() {
        super.viewDidLoad()
       //nameLabel.text =  "Hallo zu MyWorkout, dein Gewicht heute Morgen \(user.gewicht) kg"
      
    }
}
