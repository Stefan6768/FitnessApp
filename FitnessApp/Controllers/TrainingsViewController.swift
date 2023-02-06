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
    var length: Int!
    var arts: String!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = training.name
        imageView.image = training.image
     
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination as! VideoViewController
        destination.length = length
        destination.arts = arts
    }
    
    @IBAction func fuenfminpressed(){
        length = 5
        arts = training.name.components(separatedBy: " ")[0]
        performSegue(withIdentifier: "trainingsviewToVideoViewSegue", sender: self)
    }
    
    
    @IBAction func zehnminpressed(){
        length = 10
        arts = training.name.components(separatedBy: " ")[0]
        performSegue(withIdentifier: "trainingsviewToVideoViewSegue", sender: self)
    }
    
    
    @IBAction func fuenfzehnminpressed(){
        length = 15
        arts = training.name.components(separatedBy: " ")[0]
        performSegue(withIdentifier: "trainingsviewToVideoViewSegue", sender: self)
    }
    
}
