//
//  ContactsViewController.swift
//  AlexanderTestsDemo
//
//  Created by 潘皓群 on 2019/3/24.
//  Copyright © 2019 潘皓群. All rights reserved.
//

import UIKit
import SnapKit

class ContactsViewController: UIViewController {

    
    lazy var icon:UIImageView = {
        
        let imageView = UIImageView(frame:.zero)
        return imageView
        
    }()
    
    lazy var nameLabel:UILabel = {
        
        let label = UILabel(frame:.zero)
        label.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        label.textColor = UIColor.black
        label.textAlignment = .left
        label.setContentCompressionResistancePriority(.required, for: .horizontal)
        label.setContentCompressionResistancePriority(.required, for: .vertical)
        label.sizeToFit()
        return label
        
    }()
    
    lazy var ageLabel:UILabel = {
        
        let label = UILabel(frame:.zero)
        label.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        label.textColor = UIColor.black
        label.textAlignment = .left
        label.setContentCompressionResistancePriority(.required, for: .horizontal)
        label.setContentCompressionResistancePriority(.required, for: .vertical)
        label.sizeToFit()
        return label
        
    }()
    
    
    
    lazy var phoneNumberLabel:UILabel = {
        
        let label = UILabel(frame:.zero)
        label.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        label.textColor = UIColor.black
        label.textAlignment = .left
        label.setContentCompressionResistancePriority(.required, for: .horizontal)
        label.setContentCompressionResistancePriority(.required, for: .vertical)
        label.sizeToFit()
        return label
        
    }()
    
    
    
    
    let contacts:Contacts

    init(contacts:Contacts) {
        self.contacts = contacts
        super.init(nibName: nil, bundle: nil)
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initView()
        
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = false
        self.title = "聯絡人詳細資料"
        
    }

    
    func initView() {
        
        self.view.backgroundColor = UIColor.white
        self.view.addSubview(self.icon)
        self.icon.snp.makeConstraints { (make) in
            make.width.equalTo(200)
            make.height.equalTo(200)
            make.centerX.equalTo(self.view.snp.centerX)
            if #available(iOS 11.0, *) {
                make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top)
            }else{
                make.top.equalTo(self.topLayoutGuide.snp.bottom)   
            }
        }
        
        self.view.addSubview(self.nameLabel)
        self.nameLabel.snp.makeConstraints { (make) in
            make.centerX.equalTo(self.view.snp.centerX)
            make.top.equalTo(self.icon.snp.bottom).offset(16)
        
        }
        
        self.view.addSubview(self.ageLabel)
        self.ageLabel.snp.makeConstraints { (make) in
         
            make.centerX.equalTo(self.view.snp.centerX)
            make.top.equalTo(self.nameLabel.snp.bottom).offset(16)
            
        }
        
        self.view.addSubview(self.phoneNumberLabel)
        self.phoneNumberLabel.snp.makeConstraints { (make) in
      
            make.centerX.equalTo(self.view.snp.centerX)
            make.top.equalTo(self.ageLabel.snp.bottom).offset(16)
            
        }
        
        self.icon.image = UIImage.init(named: self.contacts.image)
        self.nameLabel.text = "\(self.contacts.name)"
        self.ageLabel.text = "\(self.contacts.age)"
        self.phoneNumberLabel.text = "\(self.contacts.phoneNumber)"
    }
 
}
