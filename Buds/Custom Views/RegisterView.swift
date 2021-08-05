//
//  RegisterView.swift
//  Buds
//
//  Created by Olivia Ih on 7/22/21.
//

/*
 A view showing the register page
 */

import SwiftUI

struct RegisterView: View {
    
    @EnvironmentObject var authViewModel:UserAuthViewModel
    
    @State private var email:String = ""
    @State private var password:String = ""
    @State private var displayName:String = ""
    @State private var addressString:String = ""
    
    @State private var registerSuccessful:Bool = false
    @State private var errorSigningUp:Bool = false
    
    var body: some View {
        VStack {
            
            // Register title
            HStack {
                Text("register")
                    .font(.custom("Avenir Medium", size: 48))
                    .foregroundColor(Color("Dark Teal"))
                    .padding([.leading, .top])
                    .padding(.bottom, 40)
                Spacer()
            }
            
            // error message
            if errorSigningUp {
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
            
            // Display name field
            TextField("Display name", text: $displayName)
                .padding()
                .disableAutocorrection(true)
                .textFieldStyle(TealRectangleTextFieldStyle())
            
            // Location field
            TextField("Preferred transaction location", text: $addressString)
                .padding()
                .disableAutocorrection(true)
                .textFieldStyle(TealRectangleTextFieldStyle())
                
            // Register button
            NavigationLink(destination: ButtonBarView(), isActive: $registerSuccessful) {
                    Button("REGISTER") {
                        
                        var error:String? = authViewModel.fieldsAreValid(fields: [email, password, displayName, addressString])
                        
                        if error == nil {
                            authViewModel.signUp(email: email, password: password, displayName: displayName, location: addressString)
                            
                            if authViewModel.signedIn {
                                self.registerSuccessful = true
                            }
                            else {
                                self.errorSigningUp = true
                            }
                        }
                        else {
                            self.errorSigningUp = true
                        }
                    }
                    .buttonStyle(WhiteTextTealBackgroundButton(width: UIScreen.main.bounds.width / 2, height: 60))
                    .padding()
                }
            
            Spacer()
        }
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
