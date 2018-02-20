//
//  ViewController.swift
//  AreYouFree
//
//  Created by Nicolas Salafranca on 1/30/18.
//  Copyright © 2018 Nicolas Salafranca. All rights reserved.
//

import UIKit
import FirebaseAuth

class ViewController: UIViewController {

    @IBOutlet weak var phoneNum: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
            }
    @IBAction func sendCode(_ sender: Any){
        let alert = UIAlertController(title: "Phone Number", message: "Is this your phone number?", preferredStyle: .alert)
        let action = UIAlertAction(title: "Yes", style: .default) { (UIAlertAction) in
            PhoneAuthProvider.provider().verifyPhoneNumber(self.phoneNum.text!) { (verificationID, error)
                in
                if error != nil{
                    print("error: \(error!.localizedDescription)")
                }
                else {
                    let defaults = UserDefaults.standard
                    defaults.set(verificationID, forKey: "authVID")
                    self.performSegue(withIdentifier: "code", sender: <#T##Any?#>.self)
                }
            }
        }
        let cancel = UIAlertAction(title: "No", style: .cancel, handler: nil)
        alert.addAction(action)
        alert.addAction(cancel)
        self.present(alert, animated: true, completion: nil)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    
    }

    

}

