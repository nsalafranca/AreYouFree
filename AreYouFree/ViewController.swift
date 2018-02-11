//
//  ViewController.swift
//  AreYouFree
//
//  Created by Nicolas Salafranca on 1/30/18.
//  Copyright © 2018 Nicolas Salafranca. All rights reserved.
//

import UIKit
import ContactsUI

class ViewController: UITableViewController {
    private var contactItems = ContactUtil().getContacts()!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    
    }

    
    override func numberOfSections(in tableView: UITableView) -> Int
    {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return contactItems.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell_contact", for: indexPath)
        
        if indexPath.row < contactItems.count
        {
            let item = contactItems[indexPath.row]
            cell.textLabel?.text = item.name
            
            //let accessory: UITableViewCellAccessoryType = item.done ? .checkmark : .none
            //cell.accessoryType = accessory
        }
        
        return cell
    }
    
    //like an onclick for a cell
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        tableView.deselectRow(at: indexPath, animated: true)
        
        if indexPath.row < contactItems.count
        {
            let item = contactItems[indexPath.row]
            item.name = "clicked"
            
            tableView.reloadRows(at: [indexPath], with: .automatic)
        }
        
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath)
    {
        if indexPath.row < contactItems.count
        {
            contactItems.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .top)
        }
    }

}

