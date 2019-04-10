//
//  LoginViewModel.swift
//  RACMVVM
//
//  Created by hanbo on 2019/4/4.
//  Copyright © 2019 hanbo. All rights reserved.
//

import UIKit

class LoginViewModel: NSObject {

//    var loginEnableSignal:signal
    // 控制按钮是否能点击信号
    var (loginEnableSignal, observeEnable) = Signal<Bool,NoError>.pipe()
    
    var validAccount = MutableProperty<String>("")
    var validPassword = MutableProperty<String>("")
    
    override init() {
        
        super.init()

        self.bindViewModel()
    }
    
    func bindViewModel() {
    
        
    }
    
    
    
}
