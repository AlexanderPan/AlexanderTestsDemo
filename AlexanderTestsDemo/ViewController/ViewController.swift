//
//  ViewController.swift
//  AlexanderTestsDemo
//
//  Created by 潘皓群 on 2019/3/23.
//  Copyright © 2019 潘皓群. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import SnapKit

class ViewController: UIViewController , UITableViewDelegate , UITableViewDataSource {
    
    

    private let viewModel = ViewModel.init(contactsRepository: ContactsRepository.shareInstance)
    
    private var array = Array<Contacts>()
    
    lazy var tableView:UITableView = {
        
        let tableView = UITableView(frame: CGRect.zero, style: UITableView.Style.plain)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(cellType: Cell.self)
        tableView.rowHeight = 60
        tableView.estimatedRowHeight = UITableView.automaticDimension
        
        
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initView()
        self.bindViewModel()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = false
        self.title = "聯絡人"
        
    }
    
    func initView() {
     
        self.view.addSubview(self.tableView)
        self.tableView.snp.makeConstraints { (make) in
            
            if #available(iOS 11.0, *) {
                make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top)
                make.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom)
            }else{
                make.top.equalTo(self.topLayoutGuide.snp.bottom)
                make.bottom.equalTo(self.bottomLayoutGuide.snp.top)
            }
            
            make.left.equalTo(self.view.snp.left)
            make.right.equalTo(self.view.snp.right)
        }
    }
    
    
    func bindViewModel() {
        
//        self.viewModel.errorSubject.sub
        
        
    }
    
    //MARK: - UITableViewDelegate , UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return array.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell:Cell =
            tableView.dequeueReusableCell(for: indexPath)
        
        return cell
        
    }
    


}

