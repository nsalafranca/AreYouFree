//
//  ContactUtil.swift
//  AreYouFree
//
//  Created by Michael White on 1/11/18.
//  Copyright © 2018 Michael White. All rights reserved.
//

import Foundation
import Contacts

class ContactUtil{
    var objects = [CNContact]()

    func getContacts() -> [Contact]?{
        let store = CNContactStore()
        if(CNContactStore.authorizationStatus(for: .contacts) == .notDetermined){
            store.requestAccess(for: .contacts, completionHandler: { (authorized: Bool, error: Error?) in
                if(authorized){
                    print("just authorized for contacts!!!")
                }
            })
        }else if(CNContactStore.authorizationStatus(for: .contacts) == .authorized){
            return convert(self.retrieveContactsWith(store))
        }
        return nil
    }
    
    func retrieveContactsWith(_ store: CNContactStore) -> [CNContact]{
        var results: [CNContact] = []
        let contactStore = CNContactStore()
        let keysToFetch = [CNContactFormatter.descriptorForRequiredKeys(for: .fullName)]
        var allContainers: [CNContainer] = []
        do{
            allContainers = try contactStore.containers(matching: nil)
            for container in allContainers {
                let fetchPredicate = CNContact.predicateForContactsInContainer(withIdentifier: container.identifier)
                let containerResults = try contactStore.unifiedContacts(matching: fetchPredicate, keysToFetch:keysToFetch)
                results.append(contentsOf: containerResults)
            }
            print("contacts: ", results)
        }catch{
            print(error)
        }
        return results
    }
    
    private func convert(_ cnContacts: [CNContact]) -> [Contact]{
        var convertedContacts : [Contact] = []
        for cnContact in cnContacts{
            convertedContacts.append(Contact(name: cnContact.familyName, number: "falsified num"))
        }
        return convertedContacts
    }
 
}
