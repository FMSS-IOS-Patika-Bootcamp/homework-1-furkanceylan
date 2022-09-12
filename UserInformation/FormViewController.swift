//
//  FormViewController.swift
//  UserInformation
//
//  Created by Furkan Ceylan on 10.09.2022.
//

import UIKit

typealias formHandler = (String?,String?,String?,String?) -> Void

class FormViewController: UIViewController {

    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var eMailTextField: UITextField!
    @IBOutlet weak var phoneNumberTextField: UITextField!
    
    var formCompliation: formHandler? = nil
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        view.addGestureRecognizer(gestureRecognizer)
    }
    
    @IBAction func saveButtonClicked(_ sender: Any) {
        
        guard let firstName = firstNameTextField.text else {return}
        guard let lastName = lastNameTextField.text else {return}
        guard let eMail = eMailTextField.text else {return}
        guard let phoneNumber = phoneNumberTextField.text else {return}
        
        formCompliation?(firstName,lastName,eMail,phoneNumber)
        navigationController?.popViewController(animated: true)
    }
    
    @objc func hideKeyboard(){
        view.endEditing(true)
    }
    
}
