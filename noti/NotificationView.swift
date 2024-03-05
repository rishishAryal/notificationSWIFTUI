//
//  NotificationView.swift
//  noti
//
//  Created by Rishish Aryal on 04/03/2024.
//

import SwiftUI





struct NotificationView:View {
   
    let vm: [NotificationModel] = [
        NotificationModel(type: .comment, username: "Elena Lowery", message: "Comment on your Post", time: "2h", userprofile: "image-1", postImage: "image-2", comment: "Damn What a nice View!!"),
        NotificationModel(type: .like, username: "Novalee Arnold", message: "Liked Your Post", time: "1h", userprofile: "image-4", postImage: "image-5", comment: ""),
        NotificationModel(type: .follow, username: "Reign Cameron", message: "Started Following You", time: "10min", userprofile: "image-6", postImage: "", comment: ""),
        NotificationModel(type: .comment, username: "John Doe", message: "Commented on your Post", time: "5h", userprofile: "image-7", postImage: "image-8", comment: "Great post!"),
        NotificationModel(type: .like, username: "Jane Smith", message: "Liked Your Post", time: "3h", userprofile: "image-9", postImage: "image-10", comment: ""),
        NotificationModel(type: .follow, username: "Alice Johnson", message: "Started Following You", time: "15min", userprofile: "image-1", postImage: "", comment: ""),
        NotificationModel(type: .comment, username: "Bob Johnson", message: "Commented on your Post", time: "4h", userprofile: "image-2", postImage: "image-3", comment: "Nice picture!"),
        NotificationModel(type: .like, username: "Emily Williams", message: "Liked Your Post", time: "2h", userprofile: "image-4", postImage: "image-5", comment: ""),
        NotificationModel(type: .follow, username: "Michael Brown", message: "Started Following You", time: "20min", userprofile: "image-6", postImage: "", comment: ""),
        NotificationModel(type: .comment, username: "Sarah Taylor", message: "Commented on your Post", time: "6h", userprofile: "image-7", postImage: "image-8", comment: "Beautiful shot!"),
        NotificationModel(type: .like, username: "David Clark", message: "Liked Your Post", time: "4h", userprofile: "image-9", postImage: "image-10", comment: ""),
        NotificationModel(type: .follow, username: "Emma Lee", message: "Started Following You", time: "30min", userprofile: "image-1", postImage: "", comment: ""),
        NotificationModel(type: .comment, username: "Liam Thompson", message: "Commented on your Post", time: "7h", userprofile: "image-2", postImage: "image-3", comment: "Amazing photo!"),
        NotificationModel(type: .like, username: "Olivia Martin", message: "Liked Your Post", time: "5h", userprofile: "image-4", postImage: "image-5", comment: ""),
        NotificationModel(type: .follow, username: "Noah Garcia", message: "Started Following You", time: "40min", userprofile: "image-6", postImage: "", comment: ""),
        NotificationModel(type: .comment, username: "Ava Rodriguez", message: "Commented on your Post", time: "8h", userprofile: "image-7", postImage: "image-8", comment: "Fantastic shot!"),
        NotificationModel(type: .like, username: "Sophia Hernandez", message: "Liked Your Post", time: "6h", userprofile: "image-9", postImage: "image-10", comment: ""),
        NotificationModel(type: .follow, username: "William Martinez", message: "Started Following You", time: "50min", userprofile: "image-1", postImage: "", comment: ""),
        NotificationModel(type: .comment, username: "James Young", message: "Commented on your Post", time: "9h", userprofile: "image-2", postImage: "image-3", comment: "Awesome picture!"),
        NotificationModel(type: .like, username: "Charlotte Brown", message: "Liked Your Post", time: "7h", userprofile: "image-4", postImage: "image-5", comment: ""),
        NotificationModel(type: .follow, username: "Daniel King", message: "Started Following You", time: "1h", userprofile: "image-6", postImage: "", comment: "")
    ]

    @Binding var noti:Bool
    @Binding var msg:Bool
    @State var data: [NotificationModel] = []
    
    @State var selected:NotificatcionType = .all
    
    func filterNotification(notificationType: NotificatcionType) {
        data = []
        let val : [NotificationModel] = vm.filter { data in
            data.type == notificationType
        }
        
        data = val
        
    }
    
    
    var body: some View {
        VStack{
            HStack {
                Text("Everyone").padding(.leading).fontWeight(.bold)
                Image(systemName: "chevron.down")
                Spacer()
            }.padding(.top)
          
            HStack{
                Spacer()
                Text("All").padding(.horizontal).padding(.vertical, 5).font(.caption).background(selected == .all ? .gray.opacity(0.8) :.gray.opacity(0.3) ).clipShape(RoundedRectangle(cornerRadius: 5.0)).onTapGesture {
                    
                    withAnimation(.spring) {
                        selected = .all
                        filterNotification(notificationType: .all)
                    }
                   
                   

                }
                Spacer()
                Text("Likes").padding(.horizontal).padding(.vertical, 5).font(.caption).background(selected == .like ? .gray.opacity(0.8) :.gray.opacity(0.3)).clipShape(RoundedRectangle(cornerRadius: 5.0)).onTapGesture {
                    withAnimation(.spring) {
                        selected = .like
                        filterNotification(notificationType: .like)
                    }
                   

                }
                Spacer()
                Text("Comment and reply").padding(.horizontal).padding(.vertical, 5).font(.caption).background(selected == .comment ? .gray.opacity(0.8) :.gray.opacity(0.3)).clipShape(RoundedRectangle(cornerRadius: 5.0)).onTapGesture {
                    withAnimation(.spring) {
                        selected = .comment
                        filterNotification(notificationType: .comment)
                    }
                   

                }
                Spacer()
                Text("Follows").padding(.horizontal).padding(.vertical, 5).font(.caption).background(selected == .follow ? .gray.opacity(0.8) :.gray.opacity(0.3)).clipShape(RoundedRectangle(cornerRadius: 5.0)).onTapGesture {
                    
                    withAnimation {
                        selected = .follow
                        filterNotification(notificationType: .follow)
                    }
                   

                }
                Spacer()
                
            }
            
            
            
            ScrollView {
                VStack(spacing: 15) {
                    
                    if(selected == .all) {
                        ForEach(vm, id: \.id) { notification in
                            if notification.type == .like {
                                LikeNotificationView(name: notification.username, message: notification.message, time: notification.time, profile: notification.userprofile, post: notification.postImage ?? "")
                            } else if notification.type == .comment {
                                CommentNotificationView(name: notification.username, message: notification.message, time: notification.time, profile: notification.userprofile, post: notification.postImage ?? "", comment: notification.comment ?? "")
                            } else {
                                FollowNotificationView(name: notification.username, message: notification.message, time: notification.time, profile: notification.userprofile)
                            }
                        }
                    } else {
                        
                         ForEach(data, id: \.id) { notification in
                             if notification.type == .like {
                                 LikeNotificationView(name: notification.username, message: notification.message, time: notification.time, profile: notification.userprofile, post: notification.postImage ?? "")
                             } else if notification.type == .comment {
                                 CommentNotificationView(name: notification.username, message: notification.message, time: notification.time, profile: notification.userprofile, post: notification.postImage ?? "", comment: notification.comment ?? "")
                             } else {
                                 FollowNotificationView(name: notification.username, message: notification.message, time: notification.time, profile: notification.userprofile)
                             }
                         }
                    }
                        
               
           
                    
                 
                    
                }.gesture(DragGesture().onEnded({ val in
                    if val.translation.width <= UIScreen.main.bounds.width  / 2.2 {
                        withAnimation(.spring) {
                            noti = false
                            msg = true
                        }
                        
                    }
                }))
            }
        }.onAppear {
            filterNotification(notificationType: .all)
            print(data)
        }
    }
}

struct FollowNotificationView:View {
    let name:String
    let message:String
    let time:String
    let profile:String
    
    var body: some View {
        HStack(alignment: .center) {
            Image(systemName: "person.crop.circle.fill.badge.plus").font(.title3).bold()
            VStack(alignment : .leading) {
                Image(profile).resizable().frame(width: 40, height: 40).clipShape(Circle())
                Text(name).fontWeight(.bold) + Text(" ") + Text(message).font(.system(size: 12)).fontWeight(.light) + Text(" ") + Text(time).fontWeight(.ultraLight)            }
            Spacer()
            Text("Follow Back").foregroundStyle(.white).padding(.horizontal).padding(.vertical, 5).background(.blue)
                .clipShape(RoundedRectangle(cornerRadius: 5))
        }.padding(.horizontal)
    }
}

struct CommentNotificationView :View {
    let name:String
    let message:String
    let time:String
    let profile:String
    let post:String
    let comment:String
    var body: some View {
        HStack(alignment: .center) {
            Image(systemName: "message").font(.title3).bold()
            VStack(alignment : .leading) {
                Image(profile).resizable().frame(width: 40, height: 40).clipShape(Circle())
                Text(name).fontWeight(.bold) + Text(" ") + Text(message).font(.system(size: 12)).fontWeight(.light) + Text(" ") + Text(time).fontWeight(.ultraLight)
                HStack {
                    
                    Text(comment).padding()
                    Spacer()
                    
                }.background(.thinMaterial).clipShape(RoundedRectangle(cornerRadius: 10))
            }
            Spacer()
            Image(post).resizable().aspectRatio(contentMode: .fill).frame(width: 35, height: 50).clipShape(RoundedRectangle(cornerRadius: 8))
        }.padding(.horizontal)
    }
}


struct LikeNotificationView :View {
    let name:String
    let message:String
    let time:String
    let profile:String
    let post:String
    var body: some View {
        HStack(alignment: .center) {
            Image(systemName: "heart.fill").font(.title3).bold().foregroundStyle(.red)
            VStack(alignment : .leading) {
                Image(profile).resizable().frame(width: 40, height: 40).clipShape(Circle())
                Text(name).fontWeight(.bold) + Text(" ") + Text(message).font(.system(size: 12)).fontWeight(.light) + Text(" ") + Text(time).fontWeight(.ultraLight)
            }
            Spacer()
            Image(post).resizable().aspectRatio(contentMode: .fill).frame(width: 35, height: 50).clipShape(RoundedRectangle(cornerRadius: 8))
        }.padding(.horizontal)
    }
}
