//
//  ViewModellTests.swift
//  AlexanderTestsDemoTests
//
//  Created by 潘皓群 on 2019/3/24.
//  Copyright © 2019 潘皓群. All rights reserved.
//

import XCTest
import RxSwift
import RxCocoa

class ViewModelTests: XCTestCase {

    var viewModel:ViewModel?
    var expectation:XCTestExpectation?
    
    
    override func setUp() {
        
    }

    override func tearDown() {
        self.viewModel = nil
    }

    func testWhen_API_And_DB_Success_Then_Check_Results() {
        
        self.expectation = self.expectation(description: "not receive results")
        
        self.viewModel = ViewModel.init(contactsRepository: ContactsRepository.init(implement: SuccessImplement.init()))
        
        self.viewModel?.cellViewObjectsSubject.skip(1).subscribe(onNext: { (array) in
            
            
            XCTAssertEqual(5, array.count)
            XCTAssertEqual(array[0].name, "A單元測試複製人")
            XCTAssertEqual(array[1].name, "B單元測試複製人")
            XCTAssertEqual(array[2].name, "C單元測試複製人")
            XCTAssertEqual(array[3].name, "Y單元測試複製人")
            XCTAssertEqual(array[4].name, "Z單元測試複製人")
            self.expectation?.fulfill()
            
        }).disposed(by: self.viewModel!.disposeBag)
        
        self.viewModel?.loadContacts()
        
        self.waitForExpectations(timeout: 5, handler: nil)
    }

    
    func testWhen_API_Network_Layer_Fail_Then_Check_Error_Message() {
        
        self.expectation = self.expectation(description: "not receive error message")
        
        self.viewModel = ViewModel.init(contactsRepository: ContactsRepository.init(implement: APINetworkLayerFailImplement.init()))
        
        self.viewModel?.errorSubject.skip(1).subscribe(onNext: { (error) in
            
            XCTAssertEqual(error, "API錯誤測試")
           
            self.expectation?.fulfill()
            
        }).disposed(by: self.viewModel!.disposeBag)
        
        self.viewModel?.loadContacts()
        
        self.waitForExpectations(timeout: 5, handler: nil)
    }
    
    func testWhen_API_Fail_Then_Check_Error_Message() {
        
        self.expectation = self.expectation(description: "not receive error message")
        
        self.viewModel = ViewModel.init(contactsRepository: ContactsRepository.init(implement: APIFailImplement.init()))
        
        self.viewModel?.errorSubject.skip(1).subscribe(onNext: { (error) in
            
            XCTAssertEqual(error, "api error (999)")
            
            self.expectation?.fulfill()
            
        }).disposed(by: self.viewModel!.disposeBag)
        
        self.viewModel?.loadContacts()
        
        self.waitForExpectations(timeout: 5, handler: nil)
    }
    
    
    func testWhen_DB_Fail_Then_Check_Error_Message() {
        
        self.expectation = self.expectation(description: "not receive error message")
        
        self.viewModel = ViewModel.init(contactsRepository: ContactsRepository.init(implement: DBFailImplement.init()))
        
        
        self.viewModel?.errorSubject.skip(1).subscribe(onNext: { (error) in
            
            XCTAssertEqual(error, "DB錯誤測試")
            
            self.expectation?.fulfill()
            
        }).disposed(by: self.viewModel!.disposeBag)
        
        self.viewModel?.loadContacts()
        
        self.waitForExpectations(timeout: 5, handler: nil)
    }
    
    
}



class DBFailImplement : ContactsRepositoryDelegate {
    
    
    
    func contactsListAPI(request: ContactsRequest) -> Observable<ContactsResponse> {
        
        var array = Array<Contacts>()
        
        array.append(Contacts.init(name: "C單元測試複製人", age: 50, phoneNumber: "0912345678", image: "icon2"))
        
        array.append(Contacts.init(name: "A單元測試複製人", age: 99, phoneNumber: "0912345679", image: "icon3"))
        
        array.append(Contacts.init(name: "B單元測試複製人", age: 99, phoneNumber: "0912345677", image: "icon4"))
        
        let response = ContactsResponse.init(contacts: array , statusCode: 200)
        
        
        return Observable.just(response)
        
        
    }
    
    func queryContacts() -> Observable<Array<Contacts>> {
        
        
        return Observable.error(NSError.init(domain: "", code: 300, userInfo: [NSLocalizedDescriptionKey:"DB錯誤測試"]))
        
        
    }
    
}


class APIFailImplement : ContactsRepositoryDelegate {
    
    
    
    func contactsListAPI(request: ContactsRequest) -> Observable<ContactsResponse> {
        
        return Observable.just(ContactsResponse.init(contacts: Array(), statusCode: 999))
        
        
    }
    
    func queryContacts() -> Observable<Array<Contacts>> {
        
        
        var array = Array<Contacts>()
        array.append(Contacts.init(name: "Tiffany單元測試複製人", age: 20, phoneNumber: "0912315678", image: "icon0"))
        array.append(Contacts.init(name: "Iris單元測試複製人", age: 99, phoneNumber: "0912340679", image: "icon1"))
        
        return Observable.just(array)
    }
    
}

class APINetworkLayerFailImplement : ContactsRepositoryDelegate {
    
    
    
    func contactsListAPI(request: ContactsRequest) -> Observable<ContactsResponse> {
        
        return Observable.error(NSError.init(domain: "", code: 300, userInfo: [NSLocalizedDescriptionKey:"API錯誤測試"]))
        
        
    }
    
    func queryContacts() -> Observable<Array<Contacts>> {
        
        
        var array = Array<Contacts>()
        array.append(Contacts.init(name: "Tiffany單元測試複製人", age: 20, phoneNumber: "0912315678", image: "icon0"))
        array.append(Contacts.init(name: "Iris單元測試複製人", age: 99, phoneNumber: "0912340679", image: "icon1"))
        
        return Observable.just(array)
    }
    
}



class SuccessImplement : ContactsRepositoryDelegate {
    
    
    
    func contactsListAPI(request: ContactsRequest) -> Observable<ContactsResponse> {
        
        var array = Array<Contacts>()
        
        array.append(Contacts.init(name: "C單元測試複製人", age: 50, phoneNumber: "0912345678", image: "icon2"))
        
        array.append(Contacts.init(name: "A單元測試複製人", age: 99, phoneNumber: "0912345679", image: "icon3"))
        
        array.append(Contacts.init(name: "B單元測試複製人", age: 99, phoneNumber: "0912345677", image: "icon4"))
        
        let response = ContactsResponse.init(contacts: array , statusCode: 200)
        
        
        return Observable.just(response)
        
        
    }
    
    func queryContacts() -> Observable<Array<Contacts>> {
        
        
        var array = Array<Contacts>()
        array.append(Contacts.init(name: "Z單元測試複製人", age: 20, phoneNumber: "0912315678", image: "icon0"))
        array.append(Contacts.init(name: "Y單元測試複製人", age: 99, phoneNumber: "0912340679", image: "icon1"))
        
        return Observable.just(array)
    }
    
}
