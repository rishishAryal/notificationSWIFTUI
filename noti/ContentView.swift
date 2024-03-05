//
//  ContentView.swift
//  noti
//
//  Created by Rishish Aryal on 02/03/2024.
//

import SwiftUI

struct ContentView: View {
    @State var noti:Bool = true
    @State var msg: Bool = false

    @Namespace private var animation
    @State private var selectedTab: Tab = .notifications

    enum Tab {
        case notifications
        case messages
    }
     var body: some View {
         VStack {
             HStack {
                 Text("Notifications").padding(.leading, 40)
                     .padding(.bottom,5)
                     .foregroundStyle(noti ? .blue : .color1)
                     .onTapGesture {
                         withAnimation(.spring) {
                             noti  = true
                             msg  = false
                         }
                         
                         
                     }
                 
                 Spacer()
                 Text("Messages").padding(.trailing, 40)
                     .padding(.bottom,5)
                     .foregroundStyle(msg ? .blue : .color1)
                     .onTapGesture {
                         withAnimation(.spring) {
                             noti  = false
                             msg  = true
                         }
                         
                         
                     }
             }.overlay(alignment: .bottom) {
                 RoundedRectangle(cornerRadius: 10).frame(width: UIScreen.main.bounds.width / 2, height: 3)
                     .foregroundStyle(.blue).offset(x: msg ? 100 : -100 )
                 
             }
             ZStack{
                 NotificationView(noti: $noti, msg: $msg).background(.color).ignoresSafeArea().zIndex(noti ? 1 : 0)
         
                     
                   
                         MessageView(noti:$noti,msg:$msg).background(.color).ignoresSafeArea().zIndex(msg ? 1 : 0)
                     
                     
                     
                 
                 
                 
                 
                 
                
             
             
         }
    }
}


}



#Preview {
    ContentView()
}
