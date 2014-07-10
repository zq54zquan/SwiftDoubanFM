//
//  DFSongViewController.swift
//  iDoubanFm
//
//  Created by zhou quan on 6/27/14.
//  Copyright (c) 2014 zquan. All rights reserved.
//

import UIKit

class DFSongViewController: UIViewController,DFButtonDelegate,STKAudioPlayerDelegate{
    var song:DMSong? = nil;
    var thumbView:UIImageView? = nil
    var titleLabel:UILabel? = nil
    var player:STKAudioPlayer!;
    var songs:Array<DMSong>?;
    var channel:DMChannel?
    init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        // Custom initialization
    }
    init(coder aDecoder: NSCoder!) {
        super.init(coder: aDecoder);
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        var timeButton = DFButton(frame: CGRect(x: 0, y: 20, width: 90, height: 35), time: 60)
        timeButton.backgroundColor = UIColor.grayColor()
        timeButton.titleLabel.font = UIFont.systemFontOfSize(12)
//        timeButton.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        self.view.addSubview(timeButton)
        timeButton.startCountDown()
        let image = UIImage(named: "dfpause");
        timeButton.addTarget(self, action: Selector("toggle:"), forControlEvents: UIControlEvents.TouchUpInside);
        timeButton.setImage(image, forState: UIControlState.Normal)
        
        thumbView = UIImageView(frame: CGRect(x: 0, y: 0, width: 320, height: 284))
        self.view.addSubview(thumbView)
        
        var leftButton:UIButton = UIButton.buttonWithType(UIButtonType.Custom) as UIButton
        leftButton.frame=CGRect(x: 0, y: 0, width: 40, height: 40)
        leftButton.addTarget(self, action: Selector("showList:"), forControlEvents: UIControlEvents.TouchUpInside);
        leftButton.setImage(UIImage(named: "list"), forState: UIControlState.Normal);
        
        var rightButton:UIButton = UIButton.buttonWithType(UIButtonType.Custom) as UIButton
        rightButton.frame = CGRect(x: 272, y: 0, width: 40, height: 40);
        rightButton.setImage(UIImage(named: "share"), forState: UIControlState.Normal);
        rightButton.addTarget(self, action: Selector("shareSong:"), forControlEvents: UIControlEvents.TouchUpInside);
        
        self.view.addSubview(leftButton)
        self.view.addSubview(rightButton);
        requestDM()
//        let loginRequestModule = DMLoginRequestModule();
//        loginRequestModule.requestWithMethod(HTTPMETHOD.GET, host: DOUBANDOMAIN, path: LOGINPATH, param: ["email":"zq54zquan@gmail.com","password":"7991205aa","app_name":"radio_desktop_win","version":"100"]);
//        
//
//        
//        
//        let channelRequestModuel = DMChannelRequestModule();
//        channelRequestModuel.handleChannels = {(channels:Array<DMChannel>?)->Void in
//            if (channels!.endIndex) != 0 {
//                self.channel = channels![0]
//                
//            }
//        }
//        channelRequestModuel.requestWithMethod(HTTPMETHOD.GET, host: DOUBANDOMAIN, path: CHANNELPATH, param: nil)
//        
//        let songRequestChannel = DMSongRequestModule()
//
        self.player = STKAudioPlayer();
        self.player.delegate = self;
        self.player.queueURL(NSURL(string: "http://mr4.douban.com/201407091119/7b7312cdb285a103d463c106016f3146/view/song/small/p1451184.mp3"), withQueueItemId: "123")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func timeOver() {
        println("finishStart");
    }
    
    func toggle(sender:AnyObject) {
        
        if let button = sender as? DFButton {
            if button.isSuspend {
                button.startCountDown()
            }else {
                button.pause()
            }
        }
    }
    
    func shareSong(sender:AnyObject) {
        
    }
    
    func showList(sender:AnyObject) {
        
    }
    
    func audioPlayer(audioPlayer: STKAudioPlayer!, didStartPlayingQueueItemId queueItemId: NSObject!) {
        println(queueItemId);
    }
    
    func audioPlayer(audioPlayer: STKAudioPlayer!, didFinishBufferingSourceWithQueueItemId queueItemId: NSObject!) {
    
    }
    
    func audioPlayer(audioPlayer: STKAudioPlayer!, didFinishPlayingQueueItemId queueItemId: NSObject!, withReason stopReason: STKAudioPlayerStopReason, andProgress progress: CDouble, andDuration duration: CDouble) {
    
    }
    
    func audioPlayer(audioPlayer: STKAudioPlayer!, stateChanged state: STKAudioPlayerState, previousState: STKAudioPlayerState) {
    
    }
    
    func audioPlayer(audioPlayer: STKAudioPlayer!, unexpectedError errorCode: STKAudioPlayerErrorCode) {
    
    }
    
    func audioPlayer(audioPlayer: STKAudioPlayer!, logInfo line:NSString) {
        println(line);
    }
    
    func audioPlayer(audioPlayer: STKAudioPlayer!, didCancelQueuedItems queueItems:NSArray) {
    
    }

}
