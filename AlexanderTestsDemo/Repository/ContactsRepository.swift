//
//  ContactsRepository.swift
//  AlexanderTestsDemo
//
//  Created by 潘皓群 on 2019/3/23.
//  Copyright © 2019 潘皓群. All rights reserved.
//
import Foundation
import RxSwift
import RxCocoa

protocol ContactsRepositoryDelegate {
    
    func contactsListAPI(request:ContactsRequest) -> Observable<ContactsResponse>
    func queryContacts() -> Observable<Array<Contacts>>
    
}

extension ContactsRepositoryDelegate {

    func contactsListAPI(request:ContactsRequest) -> Observable<ContactsResponse> {
        return Observable.error(makeNotImplementError())
    }
    func queryContacts() -> Observable<Array<Contacts>> {
        return Observable.error(makeNotImplementError())
    }
    
    func makeNotImplementError() -> NSError {
        return NSError.init(domain: "", code: 9999, userInfo: [NSLocalizedDescriptionKey:"Not Implement Error"])
    }

    
}


class ContactsRepositoryImplement : ContactsRepositoryDelegate {
   
    
    private let database = Database.shareInstance
    private let networking = Networking.shareInstance
    
    
    func contactsListAPI(request: ContactsRequest) -> Observable<ContactsResponse> {
        return networking.contactsListAPI(request:request)
    }
    
    func queryContacts() -> Observable<Array<Contacts>> {
        return database.queryContacts()
    }
    
}

class ContactsRepository : NSObject {
    
    var implement:ContactsRepositoryDelegate
    
    public static let shareInstance = ContactsRepository.init(implement: ContactsRepositoryImplement.init())
    
    
    
    init(implement:ContactsRepositoryDelegate) {
        self.implement = implement
        super.init()
    }
    
    
    
    func contactsListAPI(request: ContactsRequest) -> Observable<ContactsResponse> {
        return self.implement.contactsListAPI(request:request)
    }
    
    func queryContacts() -> Observable<Array<Contacts>> {
        return self.implement.queryContacts()
    }
    
    
}
