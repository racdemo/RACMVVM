//
//  ALRequestCommonError.swift
//  bbxServerSwift
//
//  Created by xlshi on 2018/2/6.
//  Copyright © 2018年 kuanyinjeji. All rights reserved.
//

import UIKit

class RequestCommonError: Swift.Error {

    var error: Error?
    var code: Bool?
    
    convenience init(error: Error) {
        self.init()
        self.error = error
    }
    
    convenience init(error: Error?, code: Bool) {
        self.init()
        self.error = error
        self.code = code
    }
    
    convenience init(code: Bool) {
        self.init()
        self.code = code
    }
}

