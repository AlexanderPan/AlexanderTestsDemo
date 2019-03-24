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
    
    
    var arraySubject:BehaviorSubject<Array<Contacts>> = BehaviorSubject.init(value: Array())
    
    var progressSubject:BehaviorSubject<Bool> = BehaviorSubject.init(value: false)
    
    var errorSubject:BehaviorSubject<String?> = BehaviorSubject.init(value: nil)
    
    deinit {
        disposeBag = DisposeBag()
    }
    
    init(contactsRepository:ContactsRepository) {
        self.contactsRepository = contactsRepository
        super.init()
        
        
        
        
    }
    
    func loadContacts() {
        
        self.progressSubject.onNext(true)
        Observable.zip(contactsRepository.contactsListAPI(request: ContactsRequest.init(memeber_token: "fake_toke")),contactsRepository.queryContacts()) { contactsResponse , array -> Array<Contacts> in
            
            var newArray = Array<Contacts>();
            
            for item in array {
                newArray.append(item)
            }
            
            for item in contactsResponse.contacts {
                newArray.append(item)
            }

            
            newArray = newArray.sorted(by: {
                $0.name < $1.name
            })

            
            return newArray
            
            }.subscribe(onNext: { (newArray) in
                
                self.arraySubject.onNext(newArray)
                self.progressSubject.onNext(false)
                
            }, onError: { (error) in
                self.errorSubject.onNext(error.localizedDescription)
                
            }, onCompleted: {
                
                
            }) {
                
        }.disposed(by: self.disposeBag)
        
        
    }
}
