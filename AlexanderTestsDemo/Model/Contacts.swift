//
//  ContactsDTO.swift
//  AlexanderTestsDemo
//
//  Created by 潘皓群 on 2019/3/23.
//  Copyright © 2019 潘皓群. All rights reserved.
//

import Foundation

class Contacts : NSObject{

    var name:String
    var age:Int
    var phoneNumber:String
    var image:String
    
    init(name:String , age:Int , phoneNumber:String
        ,image:String) {
        self.name = name
        self.age = age
        self.phoneNumber = phoneNumber
        self.image = image
        super.init()
        
        
        
    }
    
    
    
}
