//
//  NewPostView.swift
//  Buds
//
//  Created by Andrea Wang Admin on 8/11/21.
//

import SwiftUI

struct NewPostView: View {
    private let buttonWidth:CGFloat = (UIScreen.main.bounds.width - 30) / 2
    private let buttonHeight:CGFloat = 60
        
    @State private var selection:String? = nil
    
    var body: some View {
                
        VStack {
            Text("create a new post")
                .font(.custom("Avenir Medium", size: 40))
                .foregroundColor(Color("Dark Teal"))
                .padding(.bottom, 50)
                        
            NavigationLink(destination: NewForGrabsView(), tag: "forGrabs", selection: $selection) {
                Button("FOR GRABS") {
                    self.selection = "forGrabs"
                }
                .buttonStyle(WhiteTextTealBackgroundButton(width: buttonWidth, height: buttonHeight))
            }
            .padding(.bottom, 30)
            
            NavigationLink(destination: NewISOView(), tag: "iso", selection: $selection) {
                Button("IN SEARCH OF") {
                    self.selection = "iso"
                }
                .buttonStyle(WhiteTextTealBackgroundButton(width: buttonWidth, height: buttonHeight))
            }
        }
    }
}

func goNewForGrabs() {
    if let window = UIApplication.shared.windows.first {
        window.rootViewController = UIHostingController(rootView: NewForGrabsView())
        window.makeKeyAndVisible()
    }
}

func goNewISO() {
    if let window = UIApplication.shared.windows.first {
        window.rootViewController = UIHostingController(rootView: NewISOView())
        window.makeKeyAndVisible()
    }
}

struct NewPostView_Previews: PreviewProvider {
    static var previews: some View {
        NewPostView()
    }
}
