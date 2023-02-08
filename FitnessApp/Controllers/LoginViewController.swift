//
//  ViewController.swift
//  FitnessApp
//
//  Created by Stefan Schreiber on 09.01.23.
//

import UIKit


class LoginViewController: UIViewController  {
    
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    
    var isValidLogin = false

    override func viewDidLoad() {
        super.viewDidLoad()
        loginButton.isEnabled = false
        emailTextfield.delegate = self
        passwordTextfield.delegate = self
        
    }
    
    // create Tool Bar
    
 
    
    @IBAction func loginPressed(){
        if(isValidLogin){
            performSegue(withIdentifier: "loginToTabview", sender: self)
        } else {
            let alert = UIAlertController(title: "Login fehlgeschlagen", message: "Bitte versuche es erneut", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "Erneut versuchen", style: .cancel, handler: {_ in
                self.emailTextfield.text = ""
                self.passwordTextfield.text = ""
                self.loginButton.isEnabled = false
                
                alert.dismiss(animated: true)
            }))
            
            present(alert, animated:  true)
        }
    }
    
    @IBAction func signupPressed(){
        performSegue(withIdentifier: "loginToSignupSegue", sender: nil)
    }
}

extension LoginViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return true
    }
    
    @IBAction func onTextChanged() {
        if(emailTextfield.text?.count ?? 0 > 0 && passwordTextfield.text?.count ?? 0 > 0)  {
            loginButton.isEnabled = true
            if(emailTextfield.text == "sabine@gmx.com" && passwordTextfield.text == "210667") {
                isValidLogin = true
            } else {
                isValidLogin = false
            }
        }
    }
    
}

