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
        
        //假裝 Query DB ^o^
        
        // success
        var array = Array<Contacts>()
        array.append(Contacts.init(name: "周杰倫", age: 20, phoneNumber: "0912315678", image: "http://resource.holyshare.com.tw/uploads/article/600x0/142226752471S_1.png"))
        array.append(Contacts.init(name: "蔡依林", age: 99, phoneNumber: "0912340679", image: "http://resource.holyshare.com.tw/uploads/article/600x0/142226752471S_1.png"))
        return Observable.just(array)
        
        
        // fail
//        return Observable.onError(NSError.init(domain: "", code: 300, userInfo: [NSLocalizedDescriptionKey:"db connection error"]))
        

    }
    
    
 
}
