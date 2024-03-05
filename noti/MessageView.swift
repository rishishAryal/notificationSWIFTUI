//
//  MessageView.swift
//  noti
//
//  Created by Rishish Aryal on 04/03/2024.
//

import SwiftUI


struct MessageView:View {
    
    let messageModels: [MessageModel] = [
        MessageModel(id: UUID().uuidString, message: "Hello!", username: "Alice", userprofile: "image-1", unread: true),
        MessageModel(id: UUID().uuidString, message: "How are you?", username: "Bob", userprofile: "image-2", unread: false),
        MessageModel(id: UUID().uuidString, message: "Nice to meet you.", username: "Charlie", userprofile: "image-3", unread: true),
        MessageModel(id: UUID().uuidString, message: "What's up?", username: "David", userprofile: "image-4", unread: false),
        MessageModel(id: UUID().uuidString, message: "Good morning!", username: "Eve", userprofile: "image-5", unread: true),
        MessageModel(id: UUID().uuidString, message: "Hello!", username: "Alice", userprofile: "image-6", unread: false),
        MessageModel(id: UUID().uuidString, message: "How are you?", username: "Bob", userprofile: "image-7", unread: true),
        MessageModel(id: UUID().uuidString, message: "Nice to meet you.", username: "Charlie", userprofile: "image-8", unread: false),
        MessageModel(id: UUID().uuidString, message: "What's up?", username: "David", userprofile: "image-9", unread: true),
        MessageModel(id: UUID().uuidString, message: "Good morning!", username: "Eve", userprofile: "image-10", unread: false),
        MessageModel(id: UUID().uuidString, message: "Hello!", username: "Jhohn", userprofile: "image-1", unread: true),
        MessageModel(id: UUID().uuidString, message: "How are you?", username: "Sam", userprofile: "image-2", unread: false),
        MessageModel(id: UUID().uuidString, message: "Nice to meet you.", username: "Kumar", userprofile: "image-3", unread: true),
        MessageModel(id: UUID().uuidString, message: "What's up?", username: "Hari", userprofile: "image-4", unread: false),
        MessageModel(id: UUID().uuidString, message: "Good morning!", username: "Jonny", userprofile: "image-5", unread: true),
        MessageModel(id: UUID().uuidString, message: "Hello!", username: "Salman", userprofile: "image-6", unread: false),
        MessageModel(id: UUID().uuidString, message: "How are you?", username: "Bobby", userprofile: "image-7", unread: true),
        MessageModel(id: UUID().uuidString, message: "Nice to meet you.", username: "Samir", userprofile: "image-8", unread: false),
        MessageModel(id: UUID().uuidString, message: "What's up?", username: "Ritesh", userprofile: "image-9", unread: true),
        MessageModel(id: UUID().uuidString, message: "Good morning!", username: "Ram", userprofile: "image-10", unread: false)
    ]
    
    @State var unreadMessages:[MessageModel] = []
    
    func filterUnreadMessages() {
        let data = messageModels.filter { $0.unread }
        unreadMessages = data
    }

    enum msgType {
        case all
        case unread
    }
    
   

    
    @State var selected:msgType = .all

    var body: some View {
        
        VStack{
            
               
                    HStack {
                        Text("Everyone").padding(.leading).fontWeight(.bold)
                        Image(systemName: "chevron.down")
                        Spacer()
                    }.padding(.top)
                    
                    HStack{
                        Text("All").padding(.horizontal).padding(.vertical, 5).font(.caption).background(selected == .all ? .gray.opacity(0.8) : .gray.opacity(0.3)).clipShape(RoundedRectangle(cornerRadius: 5.0))
                        
                            .onTapGesture {
                               
                                    selected = .all

                                
                                                            }
                        
                        Text("Unread").padding(.horizontal).padding(.vertical, 5).font(.caption).background(selected == .unread ? .gray.opacity(0.8) : .gray.opacity(0.3)).clipShape(RoundedRectangle(cornerRadius: 5.0))   .onTapGesture {
                
                            
                            
                                selected = .unread
                                filterUnreadMessages()

                            
                        
                        }
                        Spacer()
                    }.padding(.leading ).padding(.bottom)
                
                
              
                  
                        ScrollView {
                            VStack {
                                
                                
                                
                              
                                    
                                    if(selected == .all) {
                                        ForEach(messageModels.sorted(by: { $0.unread && !$1.unread }), id: \.id) { model in
                                            if(model.unread) {
                                                UnReadMessageView(image: model.userprofile, name: model.username, message: model.message)

                                            } else {
                                                NormalMessageView(image: model.userprofile, name: model.username, message: model.message)
                                            }
                                                          
                                                       }
                                        
                                    } else {
                                        ForEach(unreadMessages, id: \.id) { msg in
                                            
                                            UnReadMessageView(image: msg.userprofile, name: msg.username, message: msg.message)
                                        }
                                    }
                                    
                                
                                
                                
                                
                                
                                
                                
                            }
                        }
                        
                    
                
        }
            
            
            
 
        
    }
    }


struct UnReadMessageView:View {
    let image:String
    let name:String
    let message:String
    var body: some View {
        HStack {
          
                Image(image).resizable().frame(width: 40, height: 40).clipShape(Circle())
            
         
            VStack(alignment: .leading){
                Text(name)
                Text(message).font(.caption).fontWeight(.bold)
            }
            
            
            Spacer()
            Circle().frame(width: 20, height: 20).foregroundStyle(.red).overlay {
                Text("5").foregroundStyle(.white).bold()
            }
        }.padding(.horizontal)
            .padding(.vertical, 5)
    }
}

struct NormalMessageView:View {
    let image:String
    let name:String
    let message:String
    var body: some View {
        HStack {
          
                Image(image).resizable().frame(width: 40, height: 40).clipShape(Circle())
            
         
            VStack(alignment: .leading){
                Text(name)
                Text(message).font(.caption)
            }
            
            
            Spacer()
         
        }.padding(.horizontal)
            .padding(.vertical, 5)
    }
}
