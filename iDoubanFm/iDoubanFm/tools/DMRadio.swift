//
//  DMRadio.swift
//  iDoubanFm
//
//  Created by ZhouQuan on 14-7-11.
//  Copyright (c) 2014年 zquan. All rights reserved.
//

import Foundation
protocol DMRadioControl {
    func playNext()
    func pause()
    func changeChannel(channel:DMChannel)
    func logout()
}

@objc
class DMRadio :NSObject,DMRadioControl , STKAudioPlayerDelegate{
    var user:DMUser?
    var channels:Array<DMChannel>?
    var currentChannel:DMChannel?
    var currentSongs:Array<DMSong>?
    var currentIndex:Int = 0
    var player:STKAudioPlayer
    
    
    class func shareInstance() -> DMRadio{
        struct DMRadioOne {
            static var once : dispatch_once_t = 0
            static var radioOne:DMRadio?
        }
        
        dispatch_once(&DMRadioOne.once, {
            DMRadioOne.radioOne = DMRadio();
        });
        
        return DMRadioOne.radioOne!;
    }
    
    init()  {
        self.player = STKAudioPlayer()
        super.init()
        self.player.delegate = self
    }
    
    func playNext() {
        if currentSongs {
            if currentIndex == currentSongs!.count-1 {
                getSongs(user?.user_id, expire: user?.expire, token: user?.token, channel_id: currentChannel?.channel_id);
            }
            var song = self.currentSongs?[currentIndex];
            currentIndex = ++currentIndex%currentSongs!.count;
            if song as? DMSong {
                self.player.queue(song!.url, withQueueItemId: song!.title)
            }
        }else {
            getSongs(user?.user_id, expire: user?.expire, token: user?.token, channel_id: currentChannel?.channel_id);
        }
    }
    
    func pause() {
        self.player.pause()
    }
    
    
    func changeChannel(channel: DMChannel) {
        self.currentChannel = channel
    }
    
    func logout() {
        user = nil
    }
    
    
    func getSongs(user_id:NSString?,expire:Int32?,token:NSString?,channel_id:Int?){
        var requestDic = NSMutableDictionary();
        if user_id {
            requestDic.setValue(user_id!, forKey: "user_id")
        }
        
        if expire {
            requestDic.setValue(NSNumber(int: expire!), forKey: "expire")
        }
        
        if token {
            requestDic.setValue(token!, forKey: "token")
        }
        
        if channel_id {
            requestDic.setValue(NSNumber(integer: channel_id!), forKey: "channel")
        }else{
            requestDic.setValue(NSNumber(integer: 1), forKey: "channel")

        }
        requestDic["type"] = "n"
        requestDic["version"] = "100"
        requestDic["app_name"] = "radio_desktop_win"
        
        let songRequestModule = DMSongRequestModule()
        songRequestModule.handleSongs = {(songs:Array<DMSong>?)->Void in
            self.currentSongs = songs;
            self.playNext();
        }
        songRequestModule.requestWithMethod(HTTPMETHOD.GET, host: DOUBANDOMAIN, path: SONGSPATH, param: requestDic);
    }
    
    
    func audioPlayer(audioPlayer: STKAudioPlayer!, didStartPlayingQueueItemId queueItemId: NSObject!) {
        //        println(queueItemId);
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