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
    @State private var errorSigningIn:Bool = false
    @State private var errorMessage:String? = nil
    
    var body: some View {
        VStack {
            
            // Log in title
            TopLeftTitle(title: "log in")
                .padding(.bottom, 40)
            
            // error message
            if errorSigningIn {
                HStack {
                    Text("ERROR: " + self.errorMessage!)
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
            NavigationLink(destination: ButtonBarView(), isActive: $loginSuccessful) {
                    Button("LOG IN") {
//                        if authViewModel.fieldsAreValid(fields: [email, password]) {
//                            authViewModel.signIn(email: email, password: password)
//
//                            if authViewModel.signedIn {
//                                self.loginSuccessful = true
//                            }
//                            else {
//                                self.errorSigningIn = true
//                            }
//                        }
//                        else {
//                            self.errorSigningIn = true
//                        }
                        
                        self.errorMessage = authViewModel.fieldsAreValid(fields: [email, password])
                        
                        if self.errorMessage == nil {
                            print("valid")
                        }
                        else {
                            print(self.errorMessage!)
                        }
                        
                        if self.errorMessage == nil {
                            self.errorMessage = authViewModel.signIn(email: email, password: password)
                            
                            if self.errorMessage == nil {
                                print("authorized")
                            }
                            else {
                                print(self.errorMessage!)
                            }
                            
                            if self.errorMessage == nil {
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
            
//            Button("test") {
//                authViewModel.signIn(email: email, password: password)
//            }
            
            Spacer()
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
