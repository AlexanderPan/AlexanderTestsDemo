//
//  ContactsResponse.swift
//  AlexanderTestsDemo
//
//  Created by 潘皓群 on 2019/3/23.
//  Copyright © 2019 潘皓群. All rights reserved.
//

import Foundation


class ContactsResponse : Decodable {
    


    var contacts:Array<Contacts>
    
    init(contacts:Array<Contacts>) {
        self.contacts = contacts
        
        
        
        
    }
    
}
