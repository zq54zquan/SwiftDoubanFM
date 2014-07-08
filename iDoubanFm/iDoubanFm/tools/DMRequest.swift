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
    
    class func shareInstance()->(DMRequest) {
        struct OneceManager {
            static var once:dispatch_once_t = 0;
            static var request:DMRequest? = nil;
        }
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
    
    
    func getRequestWithHost(host:String,path:String, param:NSDictionary,successHandle:((AnyObject?)->Void)?,errorHandler:((NSError!)->Void)?) {

        var URL:NSURL = NSURL(string: host.stringByAppendingPathComponent(path));
        
        func handleResponse(task:NSURLSessionDataTask!, response:AnyObject!) -> Void {
            var error:NSError?;
            println(response)

            if let dic:NSDictionary = response as? NSDictionary{
                if dic.valueForKey("err") as NSString == "ok"{
                    
                }
            }
        }
        
        func handleError(task:NSURLSessionDataTask!, error:NSError!) -> Void {
            println(error.localizedDescription);
            errorHandler!(error);
        }
        
        
        self.requestManager.GET(host.stringByAppendingString(path), parameters: param, success: (handleResponse), failure: (handleError));
        
    }
    
    func postRequestWithHost(host:String,path:String, param:NSDictionary,successHandle:((AnyObject?)->Void)?,errorHandler:((NSError!)->Void)?) {
        
        var URL:NSURL = NSURL(string: host.stringByAppendingPathComponent(path));
        
        func handleResponse(task:NSURLSessionDataTask!, response:AnyObject!) -> Void {
            println(response);
            
        }
        
        func handleError(task:NSURLSessionDataTask!, error:NSError!) -> Void {
            println(error.localizedDescription);
            errorHandler!(error);
        }
        
        
        self.requestManager.POST(host.stringByAppendingString(path), parameters: param, success: (handleResponse), failure: (handleError));
        
    }
    

}