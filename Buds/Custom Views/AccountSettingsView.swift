//
//  AccountSettingsView.swift
//  Buds
//
//  Created by Olivia Ih on 8/5/21.
//

/*
 A view showing the account/settings page, and some helper subviews
 */

import SwiftUI

struct AccountSettingsView: View {
    
    @EnvironmentObject var authViewModel:UserAuthViewModel
            
    @State private var currentDisplayName:String = "loading..."
    @State private var currentLocation:String = "loading..."
    @State private var currentEmail:String = "loading..."
    
    @State private var newDisplayName:String = ""
    @State private var newEmail:String = ""
    @State private var newPassword:String = ""
    @State private var newLocation:String = ""
        
    
    var body: some View {
        VStack {
            TopLeftTitle(title: "account/settings")
                .padding(.bottom, 5)
                
                
            
            ScrollView {
                ProfilePictureSetting()
                
                // text field settings
                Setting(label: "display name", currentValue: currentDisplayName, newValue: $newDisplayName)
                Setting(label: "email", currentValue: currentEmail, newValue: $newEmail)
                Setting(label: "password", currentValue: "**HIDDEN**", newValue: $newPassword)
                Setting(label: "location", currentValue: currentLocation, newValue: $newLocation)
                
                // save changes button
                Button("save changes") {
                    // TODO: code that changes backend
                    // if x field isn't empty, call appropriate function.
                    // password must be at least 6 chars (check for that
                    // instead of displaying error message?)
                    // refresh view to show changes
                    reloadUserData()
                }
                .buttonStyle(WhiteTextTealBackgroundButton(width: 200, height: 50))
                .padding(.bottom, 30)
                
                // extra options
                VStack {
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                        ExtraOption(text: "bookmarked posts")
                    })
                    
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                        ExtraOption(text: "waitlists")
                    })
                    .padding(.bottom, 30)
                    
                    
                    
                    
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                        ExtraOption(text: "my posts")
                    })
                    
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                        ExtraOption(text: "ratings and reviews")
                    })
                    
                    Button(action: {
                        authViewModel.signOut()
                    }, label: {
                        ExtraOption(text: "log out")
                    })
                }
            }
        }
        .navigationBarTitle("")
        .navigationBarHidden(true)
        .onAppear {
            getUserData()
        }
    }
    
    
    /*
     Changes current displayed user info to "loading..."
     while getting updated user data
     */
    private func reloadUserData() {
        currentDisplayName = "loading..."
        currentEmail = "loading..."
        currentLocation = "loading..."
        
        getUserData()
    }
    
    
    /*
    Updates state variables that display user data
    */
    private func getUserData() {
        currentEmail = authViewModel.getCurrentUserEmail()

        authViewModel.getCurrentUserData { data in
            currentDisplayName = data!["displayName"] as! String
            currentLocation = data!["locationStr"] as! String
        }
    }
}


struct ProfilePictureSetting: View {
    var body: some View {
        VStack {
                ProfilePicPlaceholder(size: 96)
                
                // change profile pic button
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Text("change profile picture")
                        .foregroundColor(Color("Teal"))
                        .font(.custom("Helvetica Neue Medium", size: 14))
                })
            }
        .padding(.bottom)
    }
}


struct Setting: View {
    
    var label:String
    var currentValue:String
    @Binding var newValue:String
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(label)
                    .foregroundColor(Color("Dark Teal"))
                    .font(.custom("Avenir Medium", size: 20))
                    .multilineTextAlignment(.leading)
                Text("\tcurrent: " + currentValue)
                    .foregroundColor(Color("Dark Teal"))
                    .font(.custom("Helvetica Neue Italic", size: 16))
                    .multilineTextAlignment(.leading)
                TextField("new " + label, text: $newValue)
                    .textFieldStyle(TealRectangleTextFieldStyle())
                    .autocapitalization(.none)
                    .disableAutocorrection(true)
            }
            .padding([.horizontal, .bottom])
            
            Spacer()
        }
    }
}


struct ExtraOption: View {
    
    var text:String
    
    var body: some View {
        HStack {
            Text(text)
                .font(.custom("Avenir Medium", size: 16))
                .foregroundColor(Color("Dark Teal"))
                .padding([.leading, .vertical])
            Spacer()
            Image(systemName: "chevron.right")
                .font(.title)
                .foregroundColor(Color("Dark Teal"))
                .padding(.trailing)
        }
        .background(Color("Light Gray"))
        .padding(.bottom, 1)
    }
}


struct AccountSettingsView_Previews: PreviewProvider {
    static var previews: some View {
        AccountSettingsView()
    }
}
