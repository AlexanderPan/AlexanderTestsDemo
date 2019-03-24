//
//  UITestsSendToProduct.swift
//  AlexanderTestsDemoUITests
//
//  Created by 潘皓群 on 2019/3/24.
//  Copyright © 2019 潘皓群. All rights reserved.
//



import Foundation






//MARK: - flow

// dic -> data -> **string**
// **string** -> dic -> data



extension Array {
    
    func toDataToString() throws -> String? {
        
        
        
        //        dic -> data -> **string**
        
        let data = try JSONSerialization.data(withJSONObject: self, options: JSONSerialization.WritingOptions.prettyPrinted)
        
        print("dic = \(String.init(data: data, encoding: .utf8))")
        
        return String.init(data: data, encoding: .utf8)
        
    }
    
}



extension Dictionary {
    
    func toDataToString() throws -> String? {
        
        
        
        //        dic -> data -> **string**
        
        let data = try JSONSerialization.data(withJSONObject: self, options: JSONSerialization.WritingOptions.prettyPrinted)
        
        print("dic = \(String.init(data: data, encoding: .utf8))")
        
        return String.init(data: data, encoding: .utf8)
        
    }
    
}


extension String {
    
    private func convertToDictionary() -> [String: Any]? {
        if let data = self.data(using: .utf8) {
            do {
                return try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
            } catch {
                print(error.localizedDescription)
            }
        }
        return nil
    }
    
    
    
    func toDictionaryToData() -> Data {
        
        //        **string** -> dic -> data
        
        let dictionary:Dictionary = self.convertToDictionary()!
        
        let data = try! JSONSerialization.data(withJSONObject: dictionary, options: JSONSerialization.WritingOptions.prettyPrinted)
        
        return data
    }
    
    
}
