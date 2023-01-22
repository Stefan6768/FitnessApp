//
//  StartViewController.swift
//  FitnessApp
//
//  Created by Stefan Schreiber on 09.01.23.
//

import UIKit

class StartViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    @IBAction func logoutPressed(){
        performSegue(withIdentifier: "startToLoginSegue", sender: self)
    }

}
