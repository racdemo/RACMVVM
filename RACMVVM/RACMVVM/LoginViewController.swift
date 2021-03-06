//
//  LoginViewController.swift
//  RACMVVM
//
//  Created by hanbo on 2019/4/4.
//  Copyright © 2019 hanbo. All rights reserved.
//  登录界面

import UIKit

import ReactiveCocoa
import ReactiveCocoa.Swift
import ReactiveSwift

class LoginViewController: UIViewController {
    
    //    private var isValidUsername: Bool {
    //        return accountTextField.inputTextFiled.text!.characters.count > 0
    //    }
    //
    //    private var isValidPassword: Bool {
    //        return passwordTextField.inputTextFiled.text!.characters.count > 0
    //    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        
        self.view.addGestureRecognizer(UITapGestureRecognizer(target:self, action:#selector(handleTap(sender:))))
        
        createrSubViews()
        bindViewModel()
    }
    
    /**
     *  点击空白回收键盘
     */
    @objc func handleTap(sender: UITapGestureRecognizer) {
        if sender.state == .ended {
            self.passwordTextField.inputTextFiled.resignFirstResponder()
            self.accountTextField.inputTextFiled.resignFirstResponder()
        }
        sender.cancelsTouchesInView = false
    }
    
    @objc lazy var loginViewModel: LoginViewModel = {
        let loginViewModel = LoginViewModel()
        return loginViewModel
    }()
    
    lazy var loginButton: UIButton = {
        let view = UIButton(customType: .ALCustomActionButtonTypeLogin)
        return view
    }()
    
    lazy var passwordTextField: ALInputTextFiled = {
        let view = ALInputTextFiled()
        view.showExpressPassword = true
        return view
    }()
    
    lazy var tf: UITextField = {
        let tf = UITextField()
        return tf
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
        
//        let accpuntSignal = accountTextField.inputTextFiled.reactive.continuousTextValues.map{
//            text in
//            return self.isValidUsername
//        }
//
//        let pwdSignal = passwordTextField.inputTextFiled.reactive.continuousTextValues.map{
//            text in
//            return self.isValidPassword
//        }
        
        
//        方法一
//        Signal.combineLatest(accpuntSignal, pawsSignal).map {
//            (isValidUsername, isValidPassword) in
//
//            return isValidUsername && isValidPassword
//            }.observeValues { (signupActive) in
//                self.loginButton.isEnabled = signupActive
//        }
//        方法二
//        loginButton.reactive.isEnabled <~ Signal.combineLatest(accpuntSignal, pawsSignal).map { $0 && $1 }
        
//        loginViewModel.validAccount <~ accpuntSignal
//        loginViewModel.validPassword <~ pwdSignal
        
//        loginViewModel.validAccount <~ accountTextField.inputTextFiled.reactive.continuousTextValues.map(value: "123")
        
  
//       loginButton.reactive.isEnabled <~ Signal.combineLatest(accpuntSignal, pwdSignal).map { $0 && $1 }
        
        // 绑定属性
        loginViewModel.validAccount <~ accountTextField.inputTextFiled.reactive.continuousTextValues.map { text in
            return text ?? ""
        }
        
        loginViewModel.validAccount <~ tf.reactive.textValues
        
        loginViewModel.validPassword <~ passwordTextField.inputTextFiled.reactive.continuousTextValues.map { text in
            return text ?? ""
        }
        
//        passwordTextField.inputTextFiled.reactive.text <~ loginViewModel.validAccount.producer
        
        loginButton.reactive.isEnabled <~ loginViewModel.isloginBtnEnabled
        
        loginButton.reactive.controlEvents(.touchUpInside).observeValues { (button) in
            print("登录按钮")
        self.loginViewModel.submitAction.apply(self.loginViewModel.validPassword.value).start()
        }
        
        registUserButton.reactive.controlEvents(.touchUpInside).observeValues { (button) in
            print("注册按钮")
        }
        
        loginViewModel.submitAction.values.observeValues { (str) in
            
            print("---------\(str ?? "")------")
        }
        
        loginViewModel.submitAction.errors.observeValues { (error) in
            print("错误\(error.code ?? false)==")
        }
        
        
    }

}
