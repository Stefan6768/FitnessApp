//
//  SettingsViewController.swift
//  FitnessApp
//
//  Created by Stefan Schreiber on 07.02.23.
//

import UIKit

protocol ChangeKeywordDelegate {
    func applyChanges(keyword: String)
}

class SettingsViewController: UIViewController {
    
    @IBOutlet weak var keywordTextField: UITextField!
    
    var keyword: String?
    var delegate: ChangeKeywordDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        keywordTextField.text = keyword

        }
    
    @IBAction func settingsApplyPressed() {
        keyword = keywordTextField.text
        delegate?.applyChanges(keyword: keyword!)
        self.dismiss(animated: true)
    }
}
