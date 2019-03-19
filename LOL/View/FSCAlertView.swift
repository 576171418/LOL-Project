//
//  FSCAlertView.swift
//  LOL
//
//  Created by fsc on 2019/3/12.
//  Copyright © 2019 fsc. All rights reserved.
//

import UIKit
import SnapKit

var window = UIApplication.shared.keyWindow

class FSCAlertView: UIView, UITableViewDataSource, UITableViewDelegate {
    
    var title = ""
    var message = ""
    var titleLabel: UILabel?
    var messageLabel: UILabel?
    var tableView: UITableView?
    var labelStrings: [String] = []
    var alertView: UIView = UIView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    init(frame: CGRect, title: String, message: String, labelStrings: [String]) {
        super.init(frame: frame)
        self.title = title
        self.message = message
        self.labelStrings = labelStrings
        initViews()
    }
    
    func showView(viewController: UIViewController) {
        viewController.view.addSubview(self)
        self.snp.makeConstraints { (make) in
            make.height.width.equalToSuperview()
            make.top.leading.equalToSuperview()
        }
//        print(self.frame)
//        alertView.snp.makeConstraints { (make) in
//            make.centerX.centerY.equalToSuperview()
//            make.leading.equalTo(50)
//            make.width.equalTo(300)
//            make.height.equalTo(200)
//        }
//        print(alertView.frame)
    }
    
    func initViews() {
        alertView = UIView(frame: CGRect(x: 50, y: 250, width: 280, height: 100))
//        alertView = UIView(frame: CGRect.zero)
        alertView.backgroundColor = UIColor.white
        self.addSubview(alertView)
        
        titleLabel = UILabel(frame: CGRect(x: 32, y: 16, width: 200, height: 25))
        titleLabel?.text = title
        titleLabel?.font = UIFont.systemFont(ofSize: 22)
        titleLabel?.numberOfLines = 0
        titleLabel?.textAlignment = .center
        self.alertView.addSubview(titleLabel!)
        
        messageLabel = UILabel(frame:CGRect(x: 32, y: 57, width: 200, height: 25))
        messageLabel?.text = message
        messageLabel?.numberOfLines = 0
        messageLabel?.textAlignment = .center
        self.alertView.addSubview(messageLabel!)
        
        tableView = UITableView(frame: CGRect(x: 0, y: 98, width: 280, height: 220))
        tableView?.delegate = self
        tableView?.dataSource = self
        self.alertView.addSubview(tableView!)
        
//        titleLabel?.snp.makeConstraints({ (make) in
//            make.leading.equalTo(32)
//            make.trailing.equalTo(32)
//            make.top.equalTo(16)
//            make.height.greaterThanOrEqualTo(10)
//        })
//
//        messageLabel?.snp.makeConstraints({ (make) in
//            make.top.equalTo((titleLabel?.snp.bottom)!).offset(16)
//            make.leading.equalTo(32)
//            make.trailing.equalTo(32)
//            make.height.greaterThanOrEqualTo(10)
//        })
//
//        tableView?.snp.makeConstraints({ (make) in
//            make.top.equalTo((messageLabel?.snp.bottom)!).offset(16)
//            make.leading.equalToSuperview()
//            make.trailing.equalToSuperview()
//            make.bottom.equalToSuperview()
//        })
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return labelStrings.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        cell.textLabel?.text = labelStrings[indexPath.row]
        cell.textLabel?.textAlignment = .center
        cell.textLabel?.textColor = UIColor(named: "Theme")
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
    
    
    

}
