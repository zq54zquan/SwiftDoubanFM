//
//  DFButton.swift
//  iDoubanFm
//
//  Created by zhou quan on 6/27/14.
//  Copyright (c) 2014 zquan. All rights reserved.
//

import UIKit
import QuartzCore
protocol DFButtonDelegate {
    func timeOver()->();
}



class DFButton: UIButton {
    var delegate:DFButtonDelegate? = nil
    var time:Int = 0;
    var timer:dispatch_source_t? = nil
    var isSuspend:Bool = false
    
    func showTime(displayLink:CADisplayLink){
        if(time==0){
            self.cancelCountDown();
            if delegate {
                delegate!.timeOver();
            }
        }
        var title = NSString(format: "%02d:%02d", self.time/60,self.time%60);
        self.setTitle(title, forState: UIControlState.Normal);
    }
    
    
    init(frame: CGRect,time:Int) {
        super.init(frame: frame);
        self.time = time;
        
        var displayLink = CADisplayLink(target: self, selector:"showTime:");
        self.titleEdgeInsets = UIEdgeInsets(top: 0, left: -50, bottom: 0, right: 0);
        self.imageEdgeInsets = UIEdgeInsets(top: 0, left: 50, bottom: 0, right: 0);
        displayLink.frameInterval = 30;
        displayLink.addToRunLoop(NSRunLoop.currentRunLoop(), forMode: NSDefaultRunLoopMode)
        timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, dispatch_get_main_queue());
        dispatch_source_set_timer(timer, DISPATCH_TIME_NOW, 1 * NSEC_PER_SEC, 0 * NSEC_PER_SEC);
        dispatch_source_set_event_handler(timer, {
            self.time -= 1
        });
    }
    
    func startCountDown(){
        dispatch_resume(timer);
        self.isSuspend = false;
        self.setImage(UIImage(named: "dfpause"), forState: UIControlState.Normal);

    }
    
    
    func cancelCountDown() {
        dispatch_source_cancel(self.timer)
    }
    
    func pause(){
        dispatch_suspend(timer);
        self.isSuspend = true
        self.setImage(UIImage(named: "dfplay"), forState: UIControlState.Normal);

    }
    
    deinit {
        dispatch_release(timer);
    }
}
