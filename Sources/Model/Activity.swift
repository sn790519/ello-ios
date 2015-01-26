//
//  Activity.swift
//  Ello
//
//  Created by Sean Dougherty on 12/1/14.
//  Copyright (c) 2014 Ello. All rights reserved.
//

import Foundation

import UIKit
import SwiftyJSON



class Activity: JSONAble {

    enum Kind: String {
        case OwnPost = "own_post" // main feed
        case FriendPost = "friend_post" // main feed
        case WelcomePost = "welcome_post" // main feed
        case NoisePost = "noise_post" // main feed

        // Notifications
        case RepostNotification = "repost_notification" // main feed (but collapsable)
        case NewFollowedUserPost = "new_followed_user_post" // main feed
        case NewFollowerPost = "new_follower_post"
        case PostMentionNotification = "post_mention_notification"
        case CommentMentionNotification = "comment_mention_notification"
        case InvitationAcceptedPost = "invitation_accepted_post"
        case CommentNotification = "comment_notification" // main feed
        case WelcomeNotification = "welcome_notification"
        case Unknown = "Unknown"
    }

    enum SubjectType: String {
        case Post = "Post"
        case User = "User"
        case Unknown = "Unknown"
    }

    dynamic let createdAt: NSDate
    dynamic let activityId: String
    let kind: Kind
    let subjectType: SubjectType
    dynamic let subject: AnyObject?


    init(kind: Kind, activityId: String, createdAt: NSDate, subject:AnyObject?, subjectType: SubjectType) {
        self.kind = kind
        self.activityId = activityId
        self.createdAt = createdAt
        self.subject = subject
        self.subjectType = subjectType
    }

    override class func fromJSON(data:[String: AnyObject]) -> JSONAble {
        let linkedData = JSONAble.linkItems(data)
        let json = JSON(linkedData)
        let sub = json["subject"]
        let kind = Kind(rawValue: json["kind"].stringValue) ?? Kind.Unknown
        let activityId = json["created_at"].stringValue
        let subjectType = SubjectType(rawValue: json["subject_type"].stringValue) ?? SubjectType.Unknown
        var createdAt = json["created_at"].stringValue.toNSDate() ?? NSDate()

        return Activity(kind: kind, activityId: activityId, createdAt: createdAt, subject: parseSubject(json, subjectType: subjectType), subjectType: subjectType)
    }

    class private func parseSubject(json:JSON, subjectType: SubjectType) -> AnyObject? {
        var subject:AnyObject?
        switch subjectType {
        case .User:
            if let userDict = json["subject"].object as? [String: AnyObject] {
                subject = User.fromJSON(userDict) as User
            }
        case .Post:
            if let postDict = json["subject"].object as? [String: AnyObject] {
                subject = Post.fromJSON(postDict) as Post
            }
        case .Unknown:
            subject = nil
        }
        return subject
    }

    override var description : String {
        return "\nActivity:\n\tsubjectType: \(self.subjectType.rawValue)\n\tsubject: \(subject)"
    }
}