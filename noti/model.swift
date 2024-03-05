//
//  model.swift
//  noti
//
//  Created by Rishish Aryal on 04/03/2024.
//

import Foundation


enum NotificatcionType {
    case all
    case like
    case comment
    case follow
}

struct NotificationModel {
    let id:String = UUID().uuidString
    let type:NotificatcionType
    let username:String
    let message:String
    let time:String
    let userprofile:String
    let postImage:String?
    let comment:String? 
    
}


struct MessageModel {
    let id: String
    let message: String
    let username: String
    let userprofile: String
    let unread: Bool
}
