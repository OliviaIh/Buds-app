//
//  UserAuthViewModel.swift
//  Buds
//
//  Created by Olivia Ih on 7/29/21.
//

/*
 A class that handles user authentication (signing in, signing out, signing up)
 
 Based on this Youtube tutorial: https://www.youtube.com/watch?v=vPCEIPL0U_k
 */

import SwiftUI
import FirebaseAuth


class UserAuthViewModel : ObservableObject {
    
    private let auth = Auth.auth()
    @Published var errorMessage = ""
    @Published var signedIn = false
    
    var isSignedIn: Bool {
        return auth.currentUser != nil
    }
    
    // Checks if given array of inputted field values are valid (i.e.
    // if at least one non-whitespace and non-newline character was
    // inputted for each field). Returns true if all are valid and false
    // otherwise.
    func fieldsAreValid(fields:[String]) -> Bool {
        for field in fields {
            let cleaned = field.trimmingCharacters(in: .whitespacesAndNewlines)
            
            if cleaned.isEmpty {
                self.errorMessage = "Please fill in all fields."
                return false
            }
        }
        return true
    }
    
    
    // Attempts to sign user in with given email and password. If sign-in
    // is successful, self.signedIn is set to true so that user will remain
    // logged in even if they close the app.
    func signIn(email: String, password: String) {
        auth.signIn(withEmail: email, password: password) { [weak self] result, error in
            guard result != nil, error == nil else {
                self?.errorMessage = error!.localizedDescription
                return
            }
            
            // Success
            DispatchQueue.main.async {
                self?.signedIn = true
            }
        }
    }
    
    
    // Attempts to register user with given email and password. If sign-up
    // is successful, self.signedIn is set to true so that user will remain
    // logged in even if they close the app.
    // TODO: add user to database
    func signUp(email: String, password: String, displayName: String, location: String) {
        auth.createUser(withEmail: email, password: password) { [weak self] result, error in
            guard result != nil, error == nil else {
                self?.errorMessage = error!.localizedDescription
                return
            }
            
            // Success
            DispatchQueue.main.async {
                self?.signedIn = true
            }
        }
        
        // add user to db
    }
    
    func signOut() {
        try? auth.signOut()
        
        self.signedIn = false
    }
}
