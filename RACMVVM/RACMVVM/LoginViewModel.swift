//
//  LoginViewModel.swift
//  RACMVVM
//
//  Created by hanbo on 2019/4/4.
//  Copyright © 2019 hanbo. All rights reserved.
//

import UIKit

typealias AnyAPIAction = Action<Any?, Any?, RequestCommonError>
typealias AnyAPIProducer = SignalProducer<Any?, RequestCommonError>

class LoginViewModel: NSObject {

    // 控制按钮是否能点击信号
    var (loginEnableSignal, observeEnable) = Signal<Bool,NoError>.pipe()
    
    var validAccount = MutableProperty<String?>("")
    var validPassword = MutableProperty<String>("")
    var isloginBtnEnabled = MutableProperty<Bool>(false)
    
    private(set) lazy var submitAction: AnyAPIAction = AnyAPIAction(enabledIf:  self.isloginBtnEnabled) { [unowned self] (params) -> AnyAPIProducer in
        
        print("==得到传输值\(params ?? "")==")
//        return AnyAPIProducer(value: "123")
        
        return self.netWork(params: params)
    }
    
//    private var submitProducer: AnyAPIProducer {
//        return AnyAPIProducer(value: "123")
//    }
    
    // 网络请求
    func netWork(params:Any?) -> AnyAPIProducer {
        
//        return AnyAPIProducer(value: params)
        
        return AnyAPIProducer(error: RequestCommonError.init(code: false))
    }

//    var loginAction: Action<(String?, String?), String, NoError>
    
    
    override init() {
        
        super.init()

        self.bindViewModel()
    }
    
    func bindViewModel() {
        
//        Property.combineLatest(validAccount, validPassword).map {
//            return $0.0?.count == 11 && $1.count > 0
//        }
        
        Signal.combineLatest(validAccount.signal, validPassword.signal).map {
            (validUsernameStr, validPasswordStr) in
            return validUsernameStr?.count ?? 0 > 0 && validPasswordStr.count > 0
            }.observeValues { (valid) in
                self.isloginBtnEnabled.value = valid
        }
    }
}
