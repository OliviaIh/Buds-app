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
    
    @State private var email:String = ""
    @State private var password:String = ""
    @State private var displayName:String = ""
    @State private var addressString:String = ""
    
    @State private var registerPressed:Bool = false
    
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
            NavigationLink(destination: ForGrabsView(), isActive: $registerPressed) {
                    Button("REGISTER") {
                        self.registerPressed = true
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
