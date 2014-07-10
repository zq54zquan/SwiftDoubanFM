//
//  DMChannelRequestModule.swift
//  iDoubanFm
//
//  Created by zhou quan on 7/10/14.
//  Copyright (c) 2014 zquan. All rights reserved.
//

import Foundation

class DMChannelRequestModule:DMBaseRequestModuel {
    var handleChannels:((_:Array<DMChannel>?)->Void)?
    var handleError:((_:NSError)->Void)?
    init() {
        super.init(successHandle: {(result: AnyObject?) -> Void in
            if let resultDic = result as? NSDictionary {
                var channelArray:Array<DMChannel> = [];
                for channelDic in resultDic["channels"] as NSArray {
                    if channelDic as? NSDictionary {
                        var seq_id :Int
                        if channelDic["seq_id"] as? NSNumber{
                            seq_id = Int((channelDic["seq_id"] as NSNumber).integerValue)
                        }else {
                            seq_id = Int((channelDic["seq_id"] as NSString).integerValue)

                        }
                        
                        var channel_id:Int
                        if (channelDic["channel_id"] as? NSNumber) {
                            channel_id = Int((channelDic["channel_id"] as NSNumber).integerValue)
                        }else {
                            channel_id = Int((channelDic["channel_id"] as NSString).integerValue)

                        }
                        
                        var channel = DMChannel(name: channelDic["name"] as? NSString, seq_id:seq_id, abbr_en: channelDic["abbr_en"] as? NSString, channel_id: Int(channel_id), name_en: channelDic["name_en"] as? NSString)
                        println("\(channel.name),\(channel.seq_id),\(channel.abbr_en),\(channel.channel_id),\(channel.name_en)")
                        channelArray.append(channel);
                    }
                }
                if self.successHandle {
                    self.successHandle!(channelArray)
                }


            }
            }, errorHandler: {(error: NSError!) -> Void in
                if self.handleError {
                    self.handleError!(error);
                }
            })
    }
}