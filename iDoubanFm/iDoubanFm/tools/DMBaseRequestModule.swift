//
//  DMRequestModuel.swift
//  iDoubanFm
//
//  Created by zhou quan on 7/8/14.
//  Copyright (c) 2014 zquan. All rights reserved.
//

import Foundation

enum HTTPMETHOD{
    case GET,POST,DELETE,PUT
}

class DMBaseRequestModuel {
    var successHandle:((AnyObject?)->Void)?
    var errorHandler:((error:NSError!)->Void)?
    var request:DMRequest;
    init (successHandle:((result:AnyObject?)->Void)?,errorHandler:((error:NSError!)->Void)?) {
        self.successHandle = successHandle
        self.errorHandler = errorHandler
        self.request = DMRequest.shareInstance;
    }
    func requestWithMethod(method:HTTPMETHOD,host:String,path:String,param:NSDictionary?) {
        switch method {
        case .GET:
            println("\(request),\(host),\(path),\(param)");
            self.request.getRequestWithHost(host, path: path, param: param, successHandle: self.successHandle, errorHandler: self.errorHandler)
        case .POST:
            self.request.postRequestWithHost(host, path: path, param: param, successHandle: self.successHandle, errorHandler: self.errorHandler);
        case .DELETE:
            break
        case .PUT:
            break
        default:
            break
        
        }
    }
}