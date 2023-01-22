//
//  TrainingViewController.swift
//  FitnessApp
//
//  Created by Stefan Schreiber on 09.01.23.
//

import UIKit

class TrainingsViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    
    
    var training: Trainings!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = training.name
        imageView.image = training.image
     
    }
    
    @IBAction func fuenfminpressed(){
        performSegue(withIdentifier: "trainingsviewToVideoViewSegue", sender: self)
    }
    
    @IBAction func zehnminpressed(){
        performSegue(withIdentifier: "trainingsviewToVideoViewSegue", sender: self)
    }
    
    @IBAction func fuenfzehnminpressed(){
        performSegue(withIdentifier: "trainingsviewToVideoViewSegue", sender: self)
    }
    
}
