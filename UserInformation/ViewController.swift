//
//  ViewController.swift
//  UserInformation
//
//  Created by Furkan Ceylan on 10.09.2022.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var firstNameLabel: UILabel!
    @IBOutlet weak var lastNameLabel: UILabel!
    @IBOutlet weak var eMailLabel: UILabel!
    @IBOutlet weak var phoneNumberLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(toFormVC))
    }
    
    @objc func toFormVC(){
        performSegue(withIdentifier: "toFormVC", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toFormVC"{
            if let formVC = segue.destination as? FormViewController{
                formVC.formCompliation = { firstName, lastName, eMail, phoneNumber in
                    
                    guard let firstName = firstName else {return}
                    guard let lastName = lastName else {return}
                    guard let eMail = eMail else {return}
                    guard let phoneNumber = phoneNumber else {return}
                    
                    self.firstNameLabel.text = "First Name : \(firstName)"
                    self.lastNameLabel.text = "Last Name : \(lastName)"
                    self.eMailLabel.text = "E-mail : \(eMail)"
                    self.phoneNumberLabel.text = "Phone Number : \(phoneNumber)"
                }
            }
        }
    }
}
