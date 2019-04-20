//
//  ContactsResponse.swift
//  AlexanderTestsDemo
//
//  Created by 潘皓群 on 2019/3/23.
//  Copyright © 2019 潘皓群. All rights reserved.
//

import Foundation


class ContactsResponse : Decodable {
    


    let contacts:Array<Contacts>
    let statusCode:Int
    
    init(contacts:Array<Contacts> , statusCode:Int) {
        self.contacts = contacts
        self.statusCode = statusCode
        
        
        
    }
    
    
}
