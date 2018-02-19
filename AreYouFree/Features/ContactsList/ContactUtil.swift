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
    
    func retrieveContactsWith(_ store: CNContactStore) -> [Contact]{
        var results: [CNContact] = []
        let contactStore = CNContactStore()
        let keysToFetch: [CNKeyDescriptor] = [CNContactFormatter.descriptorForRequiredKeys(for: .fullName), CNContactPhoneNumbersKey as CNKeyDescriptor]
        do {
            let fetchPredicate = CNContact.predicateForContactsInContainer(withIdentifier: contactStore.defaultContainerIdentifier())
            let containerResults = try contactStore.unifiedContacts(matching: fetchPredicate, keysToFetch:(keysToFetch))
            results.append(contentsOf: containerResults)
        } catch {
            print(error)
        }
        return convertToContacts(results)
    }
    
    private func convertToContacts(_ cnContacts: [CNContact]) -> [Contact]{
        var convertedContacts : [Contact] = []
        for cnContact in cnContacts{
            convertedContacts.append(Contact(name: cnContact.familyName, number: cnContact.phoneNumbers[0].value.stringValue))
        }
        return convertedContacts
    }
    
}
