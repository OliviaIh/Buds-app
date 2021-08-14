//
//  PostingViewModel.swift
//  Buds
//
//  Created by Olivia Ih on 8/13/21.
//

import SwiftUI
import Firebase


class PostingViewModel: ObservableObject {
    
    private var authViewModel:UserAuthViewModel

    private let db = Firestore.firestore()
    private var userData:[String : Any] = [:]
    
    init(authViewModel:UserAuthViewModel) {
        self.authViewModel = authViewModel
    }
    
    
    func postToForGrabs(title:String, description:String, selectedDate:Date, tags:[String], completionHandler: @escaping (() -> Void)) {
        self.authViewModel.getCurrentUserData { data in
            self.userData = data!
            
            let newPost = self.db.collection("forGrabsPosts").document()
            
            newPost.setData([
                "collectByDate": selectedDate,
                "description": description,
                "postDate": Date(),
                "posterUID": self.authViewModel.getCurrentUserID()!,
                "posterName": self.userData["displayName"] as! String,
                "postID": newPost.documentID,
                "tags": tags,
                "title": title,
                "waitlist": [],
                "waitlistLength": 0
            ])
            
            completionHandler()
        }
    }
    
    
    func getAllForGrabsPosts(completionHandler: @escaping (([PostData]) -> Void)) {
        self.db.collection("forGrabsPosts").getDocuments { querySnapshot, error in
            if error == nil {
                var posts:[PostData] = []
                
                for document in querySnapshot!.documents {
                    var data = document.data()
                    
                    data["postDate"] = (data["postDate"] as! Timestamp).dateValue()
                    data["collectByDate"] = (data["collectByDate"] as! Timestamp).dateValue()
                    
                    posts.append(PostData(data: data))
                }
                completionHandler(posts)
            }
        }
    }
    
    
    func postToISO(description:String, selectedDate:Date, tags:[String], completionHandler: @escaping (() -> Void)) {
        self.authViewModel.getCurrentUserData { data in
            self.userData = data!
            
            let newPost = self.db.collection("isoPosts").document()
            
            newPost.setData([
                "needByDate": selectedDate,
                "description": description,
                "postDate": Date(),
                "posterUID": self.authViewModel.getCurrentUserID()!,
                "posterName": self.userData["displayName"] as! String,
                "postID": newPost.documentID,
                "tags": tags
            ])
            
            completionHandler()
        }
    }
    
    
    func getAllISOPosts(completionHandler: @escaping (([PostData]) -> Void)) {
        self.db.collection("isoPosts").getDocuments { querySnapshot, error in
            if error == nil {
                var posts:[PostData] = []
                
                for document in querySnapshot!.documents {
                    var data = document.data()
                    
                    data["postDate"] = (data["postDate"] as! Timestamp).dateValue()
                    data["needByDate"] = (data["needByDate"] as! Timestamp).dateValue()
                    
                    posts.append(PostData(data: data))
                }
                completionHandler(posts)
            }
        }
    }
    
    
    private func convertTimeStampToDate(timestamp: Any) -> Date? {
        guard let ts = timestamp as? Timestamp else {
            return nil
        }
        return ts.dateValue()
    }

    
}

class PostData {
    let data:[String : Any]
    var id:String = ""
    
    init(data:[String : Any]) {
        self.data = data
        self.id = data["postID"] as! String
    }
}
