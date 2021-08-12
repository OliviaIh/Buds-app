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
    
    @State private var errorMessage:String? = nil
    
    
    var body: some View {
        VStack {
            
            // Log in title
            TopLeftTitle(title: "log in")
                .padding(.bottom, 40)
            
            // error message
            if self.errorMessage != nil {
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
            Button("LOG IN") {
                self.errorMessage = authViewModel.fieldsAreValid(fields: [email, password])
                
                if self.errorMessage == nil {
                    self.errorMessage = authViewModel.signIn(email: email, password: password, completionHandler: { error in
                        self.errorMessage = error
                    })
                }
            }
            .buttonStyle(WhiteTextTealBackgroundButton(width: UIScreen.main.bounds.width / 2, height: 60))
            .padding()
            
            Spacer()
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
