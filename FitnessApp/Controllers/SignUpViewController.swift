//
//  SignUpViewController.swift
//  FitnessApp
//
//  Created by Stefan Schreiber on 09.01.23.
//

import UIKit

class SignUpViewController: UIViewController {
    
    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    @IBOutlet weak var speicherButton: UIButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        speicherButton.isEnabled = true
        emailTextfield.delegate = self
        passwordTextfield.delegate = self

      
    }
    
    @IBAction func speicherButtonPressed(){
        
    }

    @IBAction func guestloginPressed(){
        performSegue(withIdentifier: "guestloginToStartSegue", sender: self)
    }
    
}

extension SignUpViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return true
    }
    
    @IBAction func onTextChanged() {
  //      if(emailTextfield.text?.count ?? 0 > 0 && passwordTextfield.text?.count ?? 0 > 0)  {
   //         loginButton.isEnabled = true
    //        if(emailTextfield.text == "stefan@gmx.com" && passwordTextfield.text == "210667") {
    //            isValidLogin = true
    //        } else {
    //            isValidLogin = false
    //        }
    //    }
    }
    
}
