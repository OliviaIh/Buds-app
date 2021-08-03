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
    
    @EnvironmentObject var authViewModel:UserAuthViewModel
    
    @State private var email:String = ""
    @State private var password:String = ""
    
    @State private var loginSuccessful:Bool = false
    @State private var errorSigningIn = false
    
    var body: some View {
        VStack {
            
            // Log in title
            HStack {
                Text("log in")
                    .font(.custom("Avenir Medium", size: 48))
                    .foregroundColor(Color("Dark Teal"))
                    .padding([.leading, .top])
                    .padding(.bottom, 40)
                Spacer()
            }
            
            // error message
            if errorSigningIn {
                HStack {
                    Text("ERROR: " + authViewModel.errorMessage)
                        .font(.custom("Avenir Heavy", size: 20))
                        .foregroundColor(Color("Red Orange"))
                        .multilineTextAlignment(.leading)
                        .padding(.leading)
                    Spacer()
                }
            }
                        
            // Email text field
            TextField("Email", text: $email)
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
            NavigationLink(destination: ForGrabsView(), isActive: $loginSuccessful) {
                    Button("LOG IN") {
                        if authViewModel.fieldsAreValid(fields: [email, password]) {
                            authViewModel.signIn(email: email, password: password)
                            
                            if authViewModel.isSignedIn {
                                self.loginSuccessful = true
                            }
                            else {
                                self.errorSigningIn = true
                            }
                        }
                        else {
                            self.errorSigningIn = true
                        }
                    }
                    .buttonStyle(WhiteTextTealBackgroundButton(width: UIScreen.main.bounds.width / 2, height: 60))
                    .padding()
                }
            
            Spacer()
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
