//
//  ISOView.swift
//  Buds
//
//  Created by Olivia Ih on 8/5/21.
//

import SwiftUI

struct ISOView: View {
    
    @EnvironmentObject var postingViewModel:PostingViewModel
    
    private let dateFormatter = DateFormatter()

    @State private var search:String = ""
    @State private var toggledFilters:[String] = []
    @State private var allPosts:[PostData] = []
    
    var body: some View {
        VStack {
            TitleAndSearchBar(title: "in search of", searchInquiry: $search)
            
            // filter buttons
            FilterButtonsView(toggledButtons: $toggledFilters)
                .padding(.bottom, 5)
            Divider()
            
            // feed
            ScrollView(showsIndicators: false){
//                ForEach(0..<10) { _ in
//                    ISOPostView(posterName: "Poster's Name", posterInfoLeft: "3 mi", posterInfoRight: "Need by Tues, July 12 at 8 PM", description: "Poster can put description here of what they’re looking for. we’ll keep it simple (just a text box), but like the for grabs description box, we’ll put suggestions of what can be useful (description of item, where/how far they’re willing to go to pick up, etc).", tags: ["furniture", "outdoors"], hoursSincePosted: 2)
//                        .padding(.bottom)
//                }
                ForEach(allPosts, id: \.id) { post in
                    ISOPostView(
                        posterName: post.data["posterName"] as! String,
                        posterInfoLeft: "3.0 mi",
                        posterInfoRight: "Need by " + dateFormatter.string(from: (post.data["needByDate"] as! Date)),
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
            
            postingViewModel.getAllISOPosts { posts in
                allPosts = posts
            }
        }
    }
}

struct ISOView_Previews: PreviewProvider {
    static var previews: some View {
        ISOView()
    }
}
