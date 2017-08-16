//
//  Message.swift
//  Makestagram
//
//  Created by Mhd Ghaith on 8/10/17.
//  Copyright © 2017 Mhd Ghaith. All rights reserved.
//

import Foundation
import FirebaseDatabase.FIRDataSnapshot
import JSQMessagesViewController.JSQMessage
class Message {
    
    // MARK: - Properties
    
    var key: String?
    let content: String
    let timestamp: Date
    let sender: User
    var dictValue: [String : Any] {
        let userDict = ["username" : sender.username,
                        "uid" : sender.uid]
        
        return ["sender" : userDict,
                "content" : content,
                "timestamp" : timestamp.timeIntervalSince1970]
    }
    
    lazy var jsqMessageValue: JSQMessage = {
        return JSQMessage(senderId: self.sender.uid,
                          senderDisplayName: self.sender.username,
                          date: self.timestamp,
                          text: self.content)
    }()
    
    
    init(content: String) {
        self.content = content
        self.timestamp = Date()
        self.sender = User.current
    }
    
    init?(snapshot: DataSnapshot) {
        guard let dict = snapshot.value as? [String : Any],
            let content = dict["content"] as? String,
            let timestamp = dict["timestamp"] as? TimeInterval,
            let userDict = dict["sender"] as? [String : Any],
            let uid = userDict["uid"] as? String,
            let username = userDict["username"] as? String
            else { return nil }
        
        self.key = snapshot.key
        self.content = content
        self.timestamp = Date(timeIntervalSince1970: timestamp)
        self.sender = User(uid: uid, username: username)
    }
}
