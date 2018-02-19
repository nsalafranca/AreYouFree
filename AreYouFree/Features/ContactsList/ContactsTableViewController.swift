//
//  ViewController.swift
//  AreYouFree
//
//  Created by Nicolas Salafranca on 1/30/18.
//  Copyright © 2018 Nicolas Salafranca. All rights reserved.
//

import UIKit
import ContactsUI

class ContactsTableViewController: UITableViewController {
    @IBOutlet var contactsTableView: UITableView!
    private var contactItems: [Contact] = [Contact]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tableView.register(UINib.init(nibName: "ContactsTableViewCell", bundle: nil), forCellReuseIdentifier: ContactsTableViewCell.reuseIdentifier())
        tableView.tableFooterView = UIView()
        initContacts()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    
    }
    
    private func initContacts(){
        let store = CNContactStore()
        store.requestAccess(for: .contacts, completionHandler: { (authorized: Bool, error: Error?) in
            if(authorized){
                self.contactItems = ContactUtil().retrieveContactsWith(store)
                DispatchQueue.main.async{
                    self.contactsTableView.reloadData()
                }
            }else{
                let alert = UIAlertController(title: "Contacts Permission", message: "For this app to function, please go into your settings and give this app permission to read your contacts.", preferredStyle: UIAlertControllerStyle.alert)
                alert.addAction(UIAlertAction(title: "Close", style: UIAlertActionStyle.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }
        })
    }

}

//MARK: UITableViewDelegate
extension ContactsTableViewController {
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
        let cellIdentifier = "ContactsTableViewCell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! ContactsTableViewCell
        cell.setup(for: contactItems[indexPath.row])
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
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 60
    }
}
