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
   
    
    public func checkFunctionToObject<T>(_ type: T.Type,functionName:String) -> T? where T : Decodable{
        
        let responseText:String? = ProcessInfo.processInfo.environment["\(functionName)"]
        
        if responseText != nil {
            
     
            let toResponse = try! JSONDecoder().decode(T.self, from: responseText!.toDictionaryToData())
            
            
            return toResponse
            
        }
        
        return nil
        
    }
    
    public func checkFunctionToArray<T>(_ type: T.Type,functionName:String) -> T? where T : Decodable{
        
        let responseText:String? = ProcessInfo.processInfo.environment["\(functionName)"]
        
        if responseText != nil {
            
            
            let toResponse = try! JSONDecoder().decode(T.self, from: responseText!.toArrayToData())
            
            
            return toResponse
            
        }
        
        return nil
        
    }
    
    
    
    private let database = Database.shareInstance
    private let networking = Networking.shareInstance
    
    
    func contactsListAPI(request: ContactsRequest) -> Observable<ContactsResponse> {
        
        
        #if UITESTS
        if let obj = self.checkFunctionToObject(ContactsResponse.self, functionName: "\(#function)") {
            return Observable.just(obj)
        }
        #endif
        return networking.contactsListAPI(request:request)
        
        
    }
    
    func queryContacts() -> Observable<Array<Contacts>> {

        
        #if UITESTS
        if let obj = self.checkFunctionToArray([Contacts].self, functionName: "\(#function)") {
            return Observable.just(obj)
        }
        #endif
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
