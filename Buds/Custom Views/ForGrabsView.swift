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
    
    @State private var search:String = ""
        
    var body: some View {
        VStack {
            TitleAndSearchBar(title: "for grabs", searchInquiry: $search)
            
            // filter buttons
            FilterButtons()
                .padding(.bottom, 5)
            Divider()
            
            // feed
            ScrollView(showsIndicators: false) {
                ForEach(0..<10) { _ in
                    ForGrabsPostView(posterName: "Poster's Name", posterInfoLeft: "45 giveaways", posterInfoRight: "4.5 stars", distance: 3, waitlistLength: 1, collectBy: "8:30 PM", title: "Couch", description: "For now, I think just a text box of what specifications the item is will suffice. We can just add a blurb of what may help, like size specifications & what it was used for etc. For now, I think just a text box of what specifications the item is will suffice. We can just add a blurb of what may help, like size specifications & what it was used for etc.For now, I think just a text box of what specifications the item is will suffice. We can just add a blurb of what may help, like size specifications & what it was used for etc. ", tags: ["furniture"], hoursSincePosted: 2)
                        .padding(.bottom)
                }
            }
        }
        .navigationBarTitle("")
        .navigationBarHidden(true)
    }
}

struct ForGrabsView_Previews: PreviewProvider {
    static var previews: some View {
        ForGrabsView()
    }
}
