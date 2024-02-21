//
//  ViewController.swift
//  Chapter12ExerciseTabitaS
//
//  Created by Tabita Sadiq on 2/20/24.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var myDatePicker: UIDatePicker!
    
    let dateFormatter: DateFormatter = DateFormatter()
    
    
//MARK: alert controller button APP
    @IBOutlet weak var labelResult: UILabel! //IBOutlet variable created here
    
    override func viewDidLoad() {
        super.viewDidLoad()
        labelResult.numberOfLines = 0
        
        // The next lines of code is for the date picker
        dateFormatter.dateStyle = .short
        dateFormatter.timeStyle = .short
    }

    @IBAction func buttonTapped(_ sender: UIButton) { // IBAction method method created here
        ////Alert Action and alert controller: To show an alert to the user you can create a UIAlertController and then add UIAlertAction to it (like buttons for 'ok' , 'cancel', etc)
        let alert = UIAlertController(title: "Halt", message: "Bazinga", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "ok", style: .default, handler: { action -> Void in
            self.labelResult.text = "ok"
        })
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: { action -> Void in
            self.labelResult.text = "Cancelled"
        })
        
        let destroyAction = UIAlertAction(title: "Destroy", style: .destructive, handler: { action -> Void in
            self.labelResult.text = "Destroyed"
        })
        
        alert.addAction(okAction)
        alert.addAction(cancelAction)
        alert.addAction(destroyAction)
        
        
        self.present(alert, animated: true, completion: nil)
        
    }
    
    
//@Mark: Alert controller text field
    @IBAction func buttonTappedTwo(_ sender: UIButton) {
        let alertTwo = UIAlertController(title: "Log In", message: "Enter Password", preferredStyle: .alert)
        
        alertTwo.addTextField(configurationHandler: {(textField) in
            textField.placeholder = "Password here"
            textField.isSecureTextEntry = true
        })
        
        
        let okActionTwo = UIAlertAction(title: "OK", style: .default, handler: { action -> Void in
            let savedText = alertTwo.textFields![0] as UITextField
            self.labelResult.text = savedText.text
        })
        
        alertTwo.addAction(okActionTwo)
        self.present(alertTwo, animated: true, completion: nil)
    }
    
    
//@MARK: Date Picker
//line 24 goes with date/time picker
    func ShowAlert(dateTime : String ) {
        let alert = UIAlertController(title: "Selected Date and Time", message: "\(dateTime)", preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "OK", style: .default, handler: { action -> Void in
        })
        alert.addAction(okAction)
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func getCurrentDateTime(_ sender: UIButton) {
        let selectedDate: String = dateFormatter.string(from: myDatePicker.date)
        ShowAlert(dateTime: selectedDate)
    }
    
    
}

