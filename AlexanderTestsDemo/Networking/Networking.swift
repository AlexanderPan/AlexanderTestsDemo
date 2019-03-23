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
            
            // fail
//            obserable.onError(NSError.init(domain: "", code: 404, userInfo: [NSLocalizedDescriptionKey:"connection time out."]))
            
            return Disposables.create()
            
        }.subscribeOn(SerialDispatchQueueScheduler(qos: .background))
        
    }
    
    
    func makeAPIContactsArray() -> Array<Contacts> {
        
        var array = Array<Contacts>()
        
        array.append(Contacts.init(name: "Steven Paul Jobs", age: 50, phoneNumber: "0912345678", image: "https://cdn2.techbang.com/system/excerpt_images/6810/inpage/2e50241b1b8e2b0ceaa4cf29e7e1c8ee.jpg?1314238302"))
        
        array.append(Contacts.init(name: "Tim Cook", age: 99, phoneNumber: "0912345679", image: "https://www.apple.com/leadership/overview/meta/og.png?201902051735"))
        
        array.append(Contacts.init(name: "Jeff Bezos", age: 99, phoneNumber: "0912345677", image: "http://img.ltn.com.tw/Upload/liveNews/BigPic/600_phpeemmWp.jpg"))
        
        
        
        return array
    }
    
    
    
}
