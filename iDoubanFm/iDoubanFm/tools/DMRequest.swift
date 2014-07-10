//
//  DMRequest.swift
//  iDoubanFm
//
//  Created by zhou quan on 7/1/14.
//  Copyright (c) 2014 zquan. All rights reserved.
//

import Foundation
class DMRequest {
    var requestManager:AFHTTPSessionManager;
    struct OneceManager {
        static var once:dispatch_once_t = 0;
        static var request:DMRequest? = nil;
    }

    class var shareInstance:DMRequest {
            dispatch_once(&OneceManager.once, {
            var requestManager = AFHTTPSessionManager();
            requestManager.requestSerializer = AFJSONRequestSerializer();
            requestManager.responseSerializer = AFJSONResponseSerializer();
            OneceManager.request = DMRequest(requestManager: requestManager);
        });
        return OneceManager.request!;
    }
    
    init(requestManager:AFHTTPSessionManager) {
        self.requestManager = requestManager;
    }
    
    
    func getRequestWithHost(host:String,path:String?, param:NSDictionary?,successHandle:((AnyObject?)->Void)?,errorHandler:((NSError!)->Void)?) {
        var URL:NSString
        if path {
            URL = host.stringByAppendingPathComponent(path!);

        }else {
            URL = host
        }
        
        func handleResponse(task:NSURLSessionDataTask!, response:AnyObject!) -> Void {
            if let dic:NSDictionary = response as? NSDictionary{
                if successHandle {
                    successHandle!(dic);
                }
            }
        }
        
        func handleError(task:NSURLSessionDataTask!, error:NSError!) -> Void {
            println(error.localizedDescription);
            if errorHandler {
                errorHandler!(error);
            }
        }
        
        
        self.requestManager.GET(URL, parameters: param, success: (handleResponse), failure: (handleError));
        
    }
    
    func postRequestWithHost(host:String,path:String, param:NSDictionary?,successHandle:((AnyObject?)->Void)?,errorHandler:((NSError!)->Void)?) {
        
        var URL:NSURL = NSURL(string: host.stringByAppendingPathComponent(path));
        
        func handleResponse(task:NSURLSessionDataTask!, response:AnyObject!) -> Void {
            if let dic:NSDictionary = response as? NSDictionary{
                if successHandle {
                    successHandle!(dic);
                }
            }
        }
        
        func handleError(task:NSURLSessionDataTask!, error:NSError!) -> Void {
            println(error.localizedDescription);
            errorHandler!(error);
        }
        
        
        self.requestManager.POST(host.stringByAppendingString(path), parameters: param, success: (handleResponse), failure: (handleError));
        
    }
    

}