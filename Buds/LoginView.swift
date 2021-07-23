//
//  LoginView.swift
//  Buds
//
//  Created by Olivia Ih on 7/22/21.
//

/*
 A view showing the login page
 */

import SwiftUI

struct LoginView: View {
    
    @State private var username:String = ""
    @State private var password:String = ""
    @State private var loginPressed:Bool = false
    
    var body: some View {
        VStack {
            
            // Log in title
            HStack {
                Text("\nlog in")
                    .font(.custom("Avenir Medium", size: 48))
                    .foregroundColor(Color("Dark Teal"))
                    .padding(.leading)
                Spacer()
            }
            
            Spacer()
            
            // Email text field
            TextField("Email", text: $username)
                .padding()
                .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                .disableAutocorrection(true)
                .textFieldStyle(TealRectangleTextFieldStyle())
                
            // Password text field
            SecureField("Password", text: $password)
                .padding()
                .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                .disableAutocorrection(true)
                .textFieldStyle(TealRectangleTextFieldStyle())
                
            // Log in button
            NavigationLink(destination: ForGrabsView(), isActive: $loginPressed) {
                    Button("LOG IN") {
                        self.loginPressed = true
                    }
                    .buttonStyle(WhiteTextTealBackgroundButton(width: UIScreen.main.bounds.width / 2, height: 60))
                    .padding()
                }
            
            Spacer()
            Spacer()
            Spacer()
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
