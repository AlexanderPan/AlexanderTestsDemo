//
//  Database.swift
//  AlexanderTestsDemo
//
//  Created by 潘皓群 on 2019/3/23.
//  Copyright © 2019 潘皓群. All rights reserved.
//

import RxSwift
import RxCocoa


class Database {
    
    public static let shareInstance = Database.init()
    
    func queryContacts() -> Observable<Array<Contacts>> {
        
        //假裝... Query DB
        
        // success
        var array = Array<Contacts>()
        array.append(Contacts.init(name: "Tiffany", age: 20, phoneNumber: "0912315678", image: "icon0"))
        array.append(Contacts.init(name: "Iris", age: 99, phoneNumber: "0912340679", image: "icon1"))
        
        return Observable.just(array).delay(2, scheduler: SerialDispatchQueueScheduler(qos: .background))


//        // fail
//        return Observable.error(NSError.init(domain: "", code: 300, userInfo: [NSLocalizedDescriptionKey:"db connection error"]))
        
        

    }
    
    
 
}
