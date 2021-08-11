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
    
    var body: some View {
        VStack{
            Text("create a new post")
                .font(.custom("Avenir Medium", size: 35))
                .foregroundColor(Color("Dark Teal"))
                .padding(.top, 20)
            
            Button(action: goNewForGrabs) {
                HStack(alignment: .center) {
                    Spacer()
                    Text("FOR GRABS")
                        .font(.custom("Avenir Black", size: 18))
                    Spacer()
                }
            }
            .buttonStyle(WhiteTextTealBackgroundButton(width: buttonWidth, height: buttonHeight))
            .padding(.top, 50)
            
            Button(action: goNewISO) {
                HStack(alignment: .center) {
                    Spacer()
                    Text("IN SEARCH OF")
                        .font(.custom("Avenir Black", size: 18))
                    Spacer()
                }
            }
            .buttonStyle(WhiteTextTealBackgroundButton(width: buttonWidth, height: buttonHeight))
            .padding(.top, 30)
            
        }
        .padding(.bottom, 100)
        
        
    
        
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
