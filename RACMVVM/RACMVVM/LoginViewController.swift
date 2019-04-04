//
//  LoginViewController.swift
//  RACMVVM
//
//  Created by hanbo on 2019/4/4.
//  Copyright © 2019 hanbo. All rights reserved.
//  登录界面

import UIKit

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        createrSubViews()
        bindViewModel()
    }
    
    lazy var loginButton: UIButton = {
        let view = UIButton(customType: .ALCustomActionButtonTypeLogin)
        return view
    }()
    
    lazy var passwordTextField: ALInputTextFiled = {
        let view = ALInputTextFiled()
        view.showExpressPassword = true
        return view
    }()
    
    lazy var accountTextField: ALInputTextFiled = {
        let view = ALInputTextFiled()
        return view
    }()
    
    lazy var registUserButton: UIButton = {
        let registUserButton = UIButton()
        registUserButton.setTitle("立即注册", for: .normal)
        registUserButton.titleLabel?.font = UIFont(.Regular,15)
        registUserButton.setTitleColor(UIColor(rgbaValue: 0x4B7FEBFF), for: .normal)
        registUserButton.setTitleColor(UIColor.darkGray, for: .highlighted)
        return registUserButton
    }()
    
    
    func createrSubViews() {
        
        view.addSubview(accountTextField)
        view.addSubview(passwordTextField)
        view.addSubview(loginButton)
        view.addSubview(registUserButton)
        
        /// 登录按钮
        self.loginButton.snp.makeConstraints { (make) in
            make.center.equalTo(view)
            make.left.equalTo(35)
            make.right.equalTo(-35)
        }
        
        /// 密码输入框
        self.passwordTextField.snp.makeConstraints { (make) in
            make.left.right.equalTo(loginButton)
            make.bottom.equalTo(loginButton.snp.top).offset(-38)
            make.height.equalTo(40)
        }
        
        /// 账号输入框
        self.accountTextField.snp.makeConstraints { (make) in
            make.centerX.width.height.equalTo(passwordTextField)
            make.bottom.equalTo(passwordTextField.snp.top).offset(-25)
        }
        
        ///立即注册
        self.registUserButton.snp.makeConstraints { (make) in
            make.right.equalTo(-45)
            make.top.equalTo(loginButton.snp.bottom).offset(15)
        }
    }
    
    // 绑定viewModel
    func bindViewModel() {
        
    }

}
