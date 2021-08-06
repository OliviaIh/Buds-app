//
//  AccountSettingsView.swift
//  Buds
//
//  Created by Olivia Ih on 8/5/21.
//

import SwiftUI

struct AccountSettingsView: View {
    
    @EnvironmentObject var authViewModel:UserAuthViewModel
        
    private let textFieldWidth = 0
    
    @State private var displayName:String = ""
    @State private var email:String = ""
    @State private var password:String = ""
    @State private var location:String = ""
    
    var body: some View {
        VStack {
            TopLeftTitle(title: "account/settings")
                .padding(.bottom, 5)
                
                
            
            ScrollView {
                ProfilePictureSetting()
                
                Setting(label: "display name", input: $displayName)
                Setting(label: "email", input: $email)
                Setting(label: "password", input: $password)
                Setting(label: "location", input: $location)
                
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Text("save changes")
                })
                .buttonStyle(WhiteTextTealBackgroundButton(width: 200, height: 50))
                .padding(.bottom)
                
                Button("temporary sign out") {
                    authViewModel.signOut()
                }
                .buttonStyle(WhiteTextTealBackgroundButton(width: 300, height: 100))
            }
        }
        .navigationBarTitle("")
        .navigationBarHidden(true)
    }
}


struct ProfilePictureSetting: View {
    var body: some View {
        VStack {
                
                // profile pic placeholder
                ZStack {
                    Circle()
                        .frame(width: 96, height: 96)
                        .foregroundColor(Color("Red Orange"))
                    Image(systemName: "person.crop.circle")
                        .foregroundColor(Color("Orange"))
                        .font(.system(size: 100, weight: .thin))
                }
                
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
    @Binding var input:String
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(label)
                    .foregroundColor(Color("Dark Teal"))
                    .font(.custom("Avenir Medium", size: 20))
                    .multilineTextAlignment(.leading)
                Text("\tcurrent: " + "CHANGE TO VALUE IN DATABASE")
                    .foregroundColor(Color("Dark Teal"))
                    .font(.custom("Helvetica Neue Italic", size: 16))
                    .multilineTextAlignment(.leading)
                TextField("new " + label, text: $input)
                    .textFieldStyle(TealRectangleTextFieldStyle())
            }
            .padding([.horizontal, .bottom])
            
            Spacer()
        }
    }
}

struct AccountSettingsView_Previews: PreviewProvider {
    static var previews: some View {
        AccountSettingsView()
    }
}
