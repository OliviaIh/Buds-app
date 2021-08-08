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
import Firebase


class UserAuthViewModel : ObservableObject {
    
    private let auth = Auth.auth()
    @Published var errorMessage = ""
    @Published var signedIn = false
    
    var isSignedIn: Bool {
        return auth.currentUser != nil
    }
    
    // Checks if given array of inputted field values are valid (i.e.
    // if at least one non-whitespace and non-newline character was
    // inputted for each field). Returns nil if all are valid and error
    // message string otherwise.
    func fieldsAreValid(fields:[String]) -> String? {
                
        for field in fields {
            let cleaned = field.trimmingCharacters(in: .whitespacesAndNewlines)
            
            if cleaned.isEmpty {
                return "Please fill in all fields."
            }
        }
        return nil
    }
    
    
    // Attempts to sign user in with given email and password. If sign-in
    // is successful, self.signedIn is set to true so that user will remain
    // logged in even if they close the app.
    func signIn(email: String, password: String) -> String? {
        
        var errorMessage:String? = "none"
                
        auth.signIn(withEmail: email, password: password) { [weak self] result, error in
//            guard result != nil, error == nil else {
//                print("Here")
////                self?.errorMessage = error!.localizedDescription
//                errorMessage = error!.localizedDescription
//
//                if errorMessage == nil {
//                    print("no error signin")
//                }
//                else {
//                    print(errorMessage! + " signin")
//                }
//
//                return
//            }
//
//            // Success
//            DispatchQueue.main.async {
//                self?.signedIn = true
//            }
            
            
//            if error == nil {
//                errorMessage = nil
//                DispatchQueue.main.async {
//                    self?.signedIn = true
//                }
//            }
//            else {
//                print("here")
//                errorMessage = error!.localizedDescription
//            }
            
            if error != nil {
                print("here")
                errorMessage = error!.localizedDescription
//                return
            }
            else {
                DispatchQueue.main.async {
                    self?.signedIn = true
                }
            }
        }
        return errorMessage
    }
    
    
    // Attempts to register user with given email and password. If sign-up
    // is successful, self.signedIn is set to true so that user will remain
    // logged in even if they close the app.
    func signUp(email: String, password: String, displayName: String, location: String) {
        auth.createUser(withEmail: email, password: password) { [weak self] result, error in
            guard result != nil, error == nil else {
                self?.errorMessage = error!.localizedDescription
                return
            }
            
            // add user to db
            let db = Firestore.firestore()
            db.collection("users").document(result!.user.uid).setData(["displayName": displayName, "locationStr": location]) { error in
                guard error == nil else {
                    self?.errorMessage = error!.localizedDescription
                    return
                }
            }
            
            // Success (authentication and database both successful)
            DispatchQueue.main.async {
                self?.signedIn = true
            }
        }
    }
    
    
    func signOut() {
        try? auth.signOut()
        
        self.signedIn = false
    }
    
    
    func getCurrentUserData() -> [String: Any]? {
        let db = Firestore.firestore()
        let uid = getCurrentUserID()
        var documentData:[String: Any]? = nil
        
        if let uid = uid {      // if uid != nil
//            print(uid)
            db.collection("users").document(uid).getDocument { document, error in
                if error == nil {
                    if document != nil && document!.exists {
//                        print("data retrieved")
//                        print(document!.data())
                        documentData = document!.data()
                    }
                }
            }
        }
        
//        if let documentData = documentData {
//            print(documentData)
//        }
//        else {
//            print("nil")
//        }
        
        return documentData
    }
    
    
    func getCurrentUserEmail() -> String {
        if isSignedIn {
            return auth.currentUser!.email!
        }
        else {
            return ""
        }
    }
    
    
    private func getCurrentUserID() -> String? {
        if isSignedIn {
            return auth.currentUser!.uid
        }
        else {
            return nil
        }
    }
}
