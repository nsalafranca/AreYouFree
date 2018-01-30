//
//  ViewController.swift
//  AreYouFree
//
//  Created by Nicolas Salafranca on 1/30/18.
//  Copyright © 2018 Nicolas Salafranca. All rights reserved.
//

import UIKit
import ContactsUI

class ViewController: CNContactViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        var contacts = [CNContact]()
        let keys = [CNContactFormatter.descriptorForRequiredKeys(for: .fullName)]
        let request = CNContactFetchRequest(keysToFetch: keys)
        
        do {
            try self.enumerateContactsWithFetchRequest(request) {
                (contact, stop) in
                // Array containing all unified contacts from everywhere
                contacts.append(contact)
            }
        }
        catch {
            print("unable to fetch contacts")
        }
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    
    }

    

}

