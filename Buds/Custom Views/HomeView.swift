//
//  HomeView.swift
//  Buds
//
//  Created by Olivia Ih on 7/22/21.
//

/*
 A view showing the title/home page
 */

import SwiftUI

struct HomeView: View {
        
    private let buttonWidth:CGFloat = (UIScreen.main.bounds.width - 30) / 2
    private let buttonHeight:CGFloat = 60
    
    @State private var selection:String? = nil
    
    
    var body: some View {
        VStack {
            
            
            Spacer()
            
            // Title and app icon
            HStack() {
                Image("App Icon")
                
                Text("buds")
                    .font(.custom("Avenir", size: 96))
                    .fontWeight(.medium)
                    .foregroundColor(Color("Dark Teal"))
                    .multilineTextAlignment(.center)
            }
            
            Spacer()
            Spacer()
            
            // Log in and register buttons
            HStack {
                NavigationLink(destination: LoginView(), tag: "login", selection: $selection) {
                    Button("LOG IN") {
                        self.selection = "login"
                    }
                    .buttonStyle(WhiteTextTealBackgroundButton(width: buttonWidth, height: buttonHeight))
                }
                                
                Spacer()
                
                NavigationLink(destination: RegisterView(), tag: "register", selection: $selection) {
                    Button("REGISTER") {
                        self.selection = "register"
                    }
                    .buttonStyle(TealTextWhiteBackgroundButton(width: buttonWidth, height: buttonHeight))
                }
            }
            .padding(.bottom, 30)
            .padding(.horizontal, 11.0)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
