//
//  StorageReference+Post.swift
//  Makestagram
//
//  Created by Mhd Ghaith on 8/8/17.
//  Copyright © 2017 Mhd Ghaith. All rights reserved.
//
import Foundation
import FirebaseStorage

extension StorageReference {
    static let dateFormatter = ISO8601DateFormatter()
    
    static func newPostImageReference() -> StorageReference {
        let uid = User.current.uid
        let timestamp = dateFormatter.string(from: Date())
        
        return Storage.storage().reference().child("images/posts/\(uid)/\(timestamp).jpg")
    }
}
