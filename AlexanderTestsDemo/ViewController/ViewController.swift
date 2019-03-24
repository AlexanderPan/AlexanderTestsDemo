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
import SVProgressHUD

class ViewController: UIViewController , UITableViewDelegate , UITableViewDataSource {

    
    

    private let viewModel = ViewModel.init(contactsRepository: ContactsRepository.shareInstance)

    private var array = Array<Contacts>()

    lazy var tableView:UITableView = {

        let tableView = UITableView(frame: CGRect.zero, style: UITableView.Style.plain)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(cellType: Cell.self)
        tableView.rowHeight = 200
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
        self.title = "聯絡人列表"
        
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

        
        self.viewModel.errorSubject.observeOn(MainScheduler.instance).subscribe(onNext: { (string) in
            
               SVProgressHUD.showError(withStatus: string)
            
        }).disposed(by: self.viewModel.disposeBag)
    

        self.viewModel.progressSubject.observeOn(MainScheduler.instance).subscribe(onNext: { (progress) in
            
            if progress {
                SVProgressHUD.show()
            } else {
                SVProgressHUD.dismiss()
            }
            
        }).disposed(by: self.viewModel.disposeBag)

        self.viewModel.arraySubject.observeOn(MainScheduler.instance).subscribe(onNext: { (array) in
            
            
            self.array = array
            self.tableView .reloadData()

            
        }).disposed(by: self.viewModel.disposeBag)
      
        self.viewModel.loadContacts()

    }
    
    //MARK: - UITableViewDelegate , UITableViewDataSource

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return array.count

    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell:Cell =
            tableView.dequeueReusableCell(for: indexPath)
        cell.updateValue(cotacts: array[indexPath.row])
        return cell

    }

    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let viewController = ContactsViewController.init(contacts: array[indexPath.row])
        self.navigationController?.pushViewController(viewController, animated: true)
        
    }






}
