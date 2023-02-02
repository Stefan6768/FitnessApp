//
//  TrainingTableViewController.swift
//  FitnessApp
//
//  Created by Stefan Schreiber on 09.01.23.
//

import UIKit

class TrainingTableViewController: UITableViewController {
    let trainingsArray = [Trainings(name: "Arm Training", image: UIImage(named: "armtraining")!),
        Trainings(name: "Bauch Training", image: UIImage(named: "bauchtraining")!),
        Trainings(name: "Bein Training", image: UIImage(named: "beintraining")!),
        Trainings(name: "Cardio Training", image: UIImage(named: "cardiotraining")!),
        Trainings(name: "Ganz Körper Training", image: UIImage(named: "ganzkoerpertraining")!),
        Trainings(name: "Po Training", image: UIImage(named: "potraining")!),
        Trainings(name: "Yoga Training", image: UIImage(named: "yogatraining")!),
        Trainings(name: "BOP Training", image: UIImage(named: "boptraining")!)]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
@IBAction func barPressed() {
    performSegue(withIdentifier: "tableViewToStartSegue", sender: self)
    
}
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return trainingsArray.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "trainingCell", for: indexPath)

        var content = cell.defaultContentConfiguration()
        content.text = trainingsArray[indexPath.row].name
        content.image = trainingsArray[indexPath.row].image
        cell.contentConfiguration = content

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let training = trainingsArray[indexPath.row]
        performSegue(withIdentifier: "showDetailTraining", sender: training)
    }
    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationViewController = segue.destination as! StartViewController
        //let training = sender as! Trainings
        //destinationViewController.training = training
    }

}
