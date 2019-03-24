//
//  FakeData.swift
//  AlexanderTestsDemoUITests
//
//  Created by 潘皓群 on 2019/3/24.
//  Copyright © 2019 潘皓群. All rights reserved.
//

import Foundation


class FakeData {

//    var name:String
//    var age:Int
//    var phoneNumber:String
//    var image:String
    
    static func api_contactsListAPI_success() -> String {
        
        var contacts = Array<Dictionary<String, Any>>()
        
        
        var contacts0 = Dictionary<String, Any>()
        contacts0.updateValue("B - UI測試複製人", forKey: "name")
        contacts0.updateValue(4, forKey: "age")
        contacts0.updateValue("0911111111", forKey: "phoneNumber")
        contacts0.updateValue("icon0", forKey: "image")
        
        var contacts1 = Dictionary<String, Any>()
        contacts1.updateValue("A - UI測試複製人", forKey: "name")
        contacts1.updateValue(11, forKey: "age")
        contacts1.updateValue("0911111112", forKey: "phoneNumber")
        contacts1.updateValue("icon1", forKey: "image")
        
        var contacts2 = Dictionary<String, Any>()
        contacts2.updateValue("C - UI測試複製人", forKey: "name")
        contacts2.updateValue(999, forKey: "age")
        contacts2.updateValue("0911111113", forKey: "phoneNumber")
        contacts2.updateValue("icon2", forKey: "image")
        
        contacts.append(contacts0)
        contacts.append(contacts1)
        contacts.append(contacts2)
        
        
        var response = Dictionary<String, Any>()
        response.updateValue(contacts, forKey: "contacts")
        
        
        return try! response.toDataToString()!
        
    }
    
    static func db_queryContacts_success() -> String {
        
        var contacts = Array<Dictionary<String, Any>>()
        
        
        var contacts0 = Dictionary<String, Any>()
        contacts0.updateValue("Z - UI測試複製人", forKey: "name")
        contacts0.updateValue(99, forKey: "age")
        contacts0.updateValue("0911111117", forKey: "phoneNumber")
        contacts0.updateValue("icon3", forKey: "image")
        
        var contacts1 = Dictionary<String, Any>()
        contacts1.updateValue("Y - UI測試複製人", forKey: "name")
        contacts1.updateValue(0, forKey: "age")
        contacts1.updateValue("0911111116", forKey: "phoneNumber")
        contacts1.updateValue("icon4", forKey: "image")
        

        
        contacts.append(contacts0)
        contacts.append(contacts1)
        
        

        
        var response = Dictionary<String, Any>()
        response.updateValue(contacts, forKey: "contacts")
        
        
        return try! response.toDataToString()!
        
        
        
    }

    
}

