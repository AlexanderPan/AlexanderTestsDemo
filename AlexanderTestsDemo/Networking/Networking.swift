//
//  Networking.swift
//  AlexanderTestsDemo
//
//  Created by 潘皓群 on 2019/3/23.
//  Copyright © 2019 潘皓群. All rights reserved.
//

import RxSwift
import RxCocoa


class Networking {

    public static let shareInstance = Networking.init()
    
    func contactsListAPI(request:ContactsRequest) -> Observable<ContactsResponse> {
        
        return Observable<ContactsResponse>.create { (obserable) -> Disposable in
            
            
            //假裝 Call API ^o^
            
            // success
            let response = ContactsResponse.init(contacts: self.makeAPIContactsArray())

            obserable.onNext(response)
            obserable.onCompleted()
            
//             fail
//            obserable.onError(NSError.init(domain: "", code: 404, userInfo: [NSLocalizedDescriptionKey:"connection time out."]))
//
            return Disposables.create()
            
        }.delay(3, scheduler: SerialDispatchQueueScheduler(qos: .background)).subscribeOn(SerialDispatchQueueScheduler(qos: .background))
        
    }
    
    
    func makeAPIContactsArray() -> Array<Contacts> {
        
        var array = Array<Contacts>()
        
        array.append(Contacts.init(name: "vicky", age: 50, phoneNumber: "0912345678", image: "icon2"))
        
        array.append(Contacts.init(name: "alex", age: 99, phoneNumber: "0912345679", image: "icon3"))
        
        array.append(Contacts.init(name: "jason", age: 99, phoneNumber: "0912345677", image: "icon4"))
        
        
        
        return array
    }
    
    
    
}
