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
    @State private var locationString:String = ""
    
    @State private var errorMessage:String? = nil
    
    var body: some View {
        VStack {
            
            // Register title
            TopLeftTitle(title: "register")
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
            
            // Display name field
            TextField("Display name", text: $displayName)
                .padding()
                .disableAutocorrection(true)
                .textFieldStyle(TealRectangleTextFieldStyle())
            
            // Location field
            TextField("Preferred transaction location", text: $locationString)
                .padding()
                .disableAutocorrection(true)
                .textFieldStyle(TealRectangleTextFieldStyle())
                
            // Register button
            Button("REGISTER") {
                self.errorMessage = authViewModel.fieldsAreValid(fields: [email, password])
                
                if self.errorMessage == nil {
                    self.errorMessage = authViewModel.signUp(email: email, password: password, displayName: displayName, location: locationString, completionHandler: { error in
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

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
