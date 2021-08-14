//
//  ForGrabsView.swift
//  Buds
//
//  Created by Olivia Ih on 7/23/21.
//

/*
 A view showing the For Grabs page
 */

import SwiftUI

struct ForGrabsView: View {
    
    @EnvironmentObject var postingViewModel:PostingViewModel
    
    private let dateFormatter = DateFormatter()
    
    @State private var search:String = ""
    @State private var toggledFilters:[String] = []
    @State private var allPosts:[PostData] = []
        
    var body: some View {
        VStack {
            TitleAndSearchBar(title: "for grabs", searchInquiry: $search)
            
            // filter buttons
            FilterButtonsView(toggledButtons: $toggledFilters)
                .padding(.bottom, 5)
            Divider()
            
            // feed
            ScrollView(showsIndicators: false) {
                
                ForEach(allPosts.sorted(by: { post1, post2 in
                    let timeSincePost1 = Calendar.current.dateComponents([.minute], from: post1.data["postDate"] as! Date, to: Date()).minute!
                    let timeSincePost2 = Calendar.current.dateComponents([.minute], from: post2.data["postDate"] as! Date, to: Date()).minute!
                    
                    if timeSincePost1 >= timeSincePost2 {
                        return false
                    }
                    else {
                        return true
                    }
                }), id: \.id) { post in
                    ForGrabsPostView(
                        posterName: post.data["posterName"] as! String,
                        posterInfoLeft: "10 giveaways",
                        posterInfoRight: "4.8 stars",
                        distance: 5,
                        waitlistLength: post.data["waitlistLength"] as! Int,
                        collectBy: dateFormatter.string(from: (post.data["collectByDate"] as! Date)),
                        title: post.data["title"] as! String,
                        description: post.data["description"] as! String,
                        tags: post.data["tags"] as! [String],
                        hoursSincePosted: Calendar.current.dateComponents([.hour], from: post.data["postDate"] as! Date, to: Date()).hour!)
                }
            }
        }
        .navigationBarTitle("")
        .navigationBarHidden(true)
        .onAppear {
            dateFormatter.dateStyle = .medium
            dateFormatter.timeStyle = .short
            
            postingViewModel.getAllForGrabsPosts { posts in
                allPosts = posts
            }
        }
    }
}

struct ForGrabsView_Previews: PreviewProvider {
    static var previews: some View {
        ForGrabsView()
    }
}
