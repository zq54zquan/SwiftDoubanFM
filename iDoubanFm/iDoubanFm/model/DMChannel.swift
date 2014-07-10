//
//  DMChannel.swift
//  iDoubanFm
//
//  Created by zhou quan on 7/10/14.
//  Copyright (c) 2014 zquan. All rights reserved.
//

import Foundation
class DMChannel {
    let name:NSString?
    let seq_id:Int?
    let abbr_en:NSString?
    let channel_id:Int?
    let name_en:NSString?
    
    init(name:NSString?,seq_id:Int?,abbr_en:NSString?,channel_id:Int?,name_en:NSString?) {
        self.name = name;
        self.seq_id = seq_id
        self.abbr_en = abbr_en
        self.channel_id = channel_id
        self.name_en = name_en;
    }
}