//
//  ViewModel.swift
//  AlexanderTestsDemo
//
//  Created by 潘皓群 on 2019/3/23.
//  Copyright © 2019 潘皓群. All rights reserved.
//


import RxSwift
import RxCocoa
import Foundation

class ViewModel: NSObject {

    var disposeBag = DisposeBag()
    private let contactsRepository:ContactsRepository
    
    var cellViewObjects = Array<Contacts>()
    var cellViewObjectsSubject:BehaviorSubject<Array<Contacts>> = BehaviorSubject.init(value: Array())
    
    var progressSubject:BehaviorSubject<Bool> = BehaviorSubject.init(value: false)
    
    var errorSubject:BehaviorSubject<String?> = BehaviorSubject.init(value: nil)
    
    deinit {
        disposeBag = DisposeBag()
    }
    
    init(contactsRepository:ContactsRepository = ContactsRepository.shareInstance) {
        self.contactsRepository = contactsRepository
        super.init()
        
        
        
        
    }
    
    func loadContacts() {
        
        self.progressSubject.onNext(true)
        Observable.zip(contactsRepository.contactsListAPI(request: ContactsRequest.init(memeber_token: "fake_toke")),contactsRepository.queryContacts()) { contactsResponse , array -> (Array<Contacts> , Int) in
            
                
                var contacts = Array<Contacts>();
                
                for item in array {
                    contacts.append(item)
                }
                
                for item in contactsResponse.contacts {
                    contacts.append(item)
                }
                
                
                contacts = contacts.sorted(by: {
                    $0.name < $1.name
                })
                
                
                return (contacts , contactsResponse.statusCode)
        
            
            
            }.flatMap({ (contacts ,  statusCode) -> Observable<Array<Contacts>> in
                
                if statusCode == 200 {
                    return Observable.just(contacts)
                } else {
                    
                    return Observable.error(NSError.init(domain: "", code: statusCode, userInfo: [NSLocalizedDescriptionKey:"api error (\(statusCode))"]))
                    
                }
                
                
            }).subscribe(onNext: {
                contacts  in
                
                self.cellViewObjectsSubject.onNext(contacts)
                self.progressSubject.onNext(false)
                
            }, onError: { (error) in
                
                self.errorSubject.onNext(error.localizedDescription)
                
            }, onCompleted: {
                
                
            }) {
                
        }.disposed(by: self.disposeBag)
        
        
    }
}
