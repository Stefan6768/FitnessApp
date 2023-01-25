//
//  PersDatenViewController.swift
//  FitnessApp
//
//  Created by Stefan Schreiber on 09.01.23.
//






import UIKit

class PersDatenViewController: UIViewController {
    
    
    
    @IBOutlet weak var geschlechtField: UITextField!
    @IBOutlet weak var groesseField: UITextField!
    @IBOutlet weak var gewichtField: UITextField!
    @IBOutlet weak var alterField: UITextField!
    let geschlechter = ["weiblich", "männlich", "divers"]
    let geschlechterPicker = UIPickerView()
    let alterPicker = UIDatePicker()
    
    @IBOutlet weak var speicherButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        keyboardDismissable()
        createAlterPicker()
        
        
        speicherButton.isEnabled = true
        groesseField.keyboardType = .numberPad
        gewichtField.keyboardType = .numberPad
        
        geschlechtField.delegate = self
        groesseField.delegate = self
        gewichtField.delegate = self
        alterField.delegate = self
        
        
        geschlechterPicker.delegate = self
        geschlechterPicker.dataSource = self
        geschlechtField.inputView = geschlechterPicker
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyBoardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        
    }
    // keyboard overlaps view
    
    @objc func keyboardWillShow(notification: NSNotification) {
        if self.view.frame.origin.y == 0 && (alterField.isFirstResponder) {
            if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
                self.view.frame.origin.y -= keyboardSize.height
            }
        }
    }
    
    @objc func keyBoardWillHide(notification: NSNotification) {
        if self.view.frame.origin.y != 0 {
            self.view.frame.origin.y = 0
        }
    }
    
    // dismiss keyboard outside
    @objc func dissmissKeyboardTouchOutside() {
        self.view.endEditing(true)
    }
    func keyboardDismissable() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dissmissKeyboardTouchOutside))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    // date picker
    
    @objc func alterPressed() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yyyy"
        alterField.text = dateFormatter.string(from: alterPicker.date)
        geschlechtField.becomeFirstResponder()
    }
    
    func createAlterPicker() {
        alterPicker.preferredDatePickerStyle = .wheels
        alterPicker.datePickerMode = .date
        alterField.inputView = alterPicker
        alterField.inputAccessoryView = createToolbar()
        
        
        // toolbar
    }
    
    func createToolbar() -> UIToolbar {
        let toolbar = UIToolbar()
        
        toolbar.sizeToFit()
        let button = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(alterPressed))
        toolbar.setItems([button], animated: true)
        
        return toolbar
    }
    
    // Daten Transfer
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationViewController = segue.destination as! PersSpeicherViewController
        let user = sender as! User
        destinationViewController.user = user
    }
    
    @IBAction func buttonPressed() {
        let geschlecht = geschlechtField.text ?? ""
        let groesse = Int(groesseField.text!) ?? 0
        let gewicht = Int(gewichtField.text!) ?? 0
        let alter = alterField.text ?? ""
        
        let user = User(geschlecht: geschlecht, groesse: groesse, gewicht: gewicht, alter: alter)
        performSegue(withIdentifier: "persdatenToPersSpeicherViewControllerSegue", sender: user)
    }
}
    
    extension PersDatenViewController: UITextFieldDelegate{
        func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            self.view.endEditing(true)
        }
    }

     // Pickers

extension PersDatenViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch pickerView {
        case geschlechterPicker:
            return geschlechter.count
        default: return 0
        }
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch pickerView {
        case geschlechterPicker:
            return geschlechter[row]
        default: return ""
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch pickerView {
        case geschlechterPicker:
            geschlechtField.text = geschlechter[row]
        default: print("Picker nicht bekannt")
        }
        // self.view.endEditing(true)
        groesseField.becomeFirstResponder()
    }
}

