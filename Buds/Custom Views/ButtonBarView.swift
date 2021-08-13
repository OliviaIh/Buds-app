//
//  ButtonBarView.swift
//  Buds
//
//  Created by Andrea Wang Admin on 8/4/21.
//

import SwiftUI

struct ButtonBarView: View {

    
    var body: some View {
        TabView {
            ForGrabsView()
                .tabItem {
                    Label("for grabs", systemImage: "cart.badge.plus")
                }
            
            ISOView()
                .tabItem {
                    Label("in search of", systemImage: "questionmark.circle")
                }
            
            NewPostView()
                .tabItem {
                    Label("new post", systemImage: "plus.square.fill")
                }
            
            MessagesView()
                .tabItem {
                    Label("messages", systemImage: "tray")
                }
            
            AccountSettingsView()
                .tabItem {
                    Label("profile", systemImage: "person.crop.circle")
                }
        }
        .onAppear() {
            UITabBar.appearance().barTintColor = .white
        }
        .accentColor(Color("Dark Teal"))
        
    }
}

struct ButtonBarView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonBarView()
    }
}
