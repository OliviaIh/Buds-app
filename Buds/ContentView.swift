//
//  ContentView.swift
//  Buds
//
//  Created by Olivia Ih on 7/19/21.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var authViewModel:UserAuthViewModel
    
    var body: some View {
        NavigationView {
            if authViewModel.signedIn {
                ForGrabsView()
            }
            else {
                HomeView()
            }
        }
        .onAppear {
            authViewModel.signedIn = authViewModel.isSignedIn
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
