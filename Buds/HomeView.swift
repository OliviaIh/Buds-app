//
//  HomeView.swift
//  Buds
//
//  Created by Olivia Ih on 7/22/21.
//

import SwiftUI

struct HomeView: View {
    
    @State private var selection:String? = nil
    
    var body: some View {
        NavigationView {
            VStack {
                
                Spacer()
                
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
                
                HStack {
                    NavigationLink(destination: LoginView(), tag: "login", selection: $selection) {
                        EmptyView()
                    }
                    NavigationLink(destination: RegisterView(), tag: "register", selection: $selection) {
                        EmptyView()
                    }
                    
                    Button("LOG IN") {
                        self.selection = "login"
                    }
                    .foregroundColor(Color.white)
                    .padding([.leading, .trailing], 58)
                    .padding([.top, .bottom], 17)
                    .background(Color("Teal"))
                    .cornerRadius(6.0)
                    .font(.custom("Avenir Black", size: 14))
                    
                    
                    Button("REGISTER") {
                        self.selection = "register"
                    }
                    .foregroundColor(Color("Teal"))
                    .padding([.leading, .trailing], 58)
                    .padding([.top, .bottom], 17)
                    .border(/*@START_MENU_TOKEN@*/Color("Teal")/*@END_MENU_TOKEN@*/, width: 4)
                    .cornerRadius(6.0)
                    .font(.custom("Avenir Black", size: 14))
                }
                .padding(.bottom, 30)
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
