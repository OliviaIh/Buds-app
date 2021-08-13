//
//  ISOView.swift
//  Buds
//
//  Created by Olivia Ih on 8/5/21.
//

import SwiftUI

struct ISOView: View {
    
    @State private var search:String = ""
    
    var body: some View {
        VStack {
            TitleAndSearchBar(title: "in search of", searchInquiry: $search)
            
            // filter buttons
            FilterButtons()
                .padding(.bottom, 5)
            Divider()
            
            // feed
            ScrollView(showsIndicators: false){
                ForEach(0..<10) { _ in
                    ISOPostView(posterName: "Poster's Name", posterInfoLeft: "3 mi", posterInfoRight: "Need by Tues, July 12 at 8 PM", description: "Poster can put description here of what they’re looking for. we’ll keep it simple (just a text box), but like the for grabs description box, we’ll put suggestions of what can be useful (description of item, where/how far they’re willing to go to pick up, etc).", tags: ["furniture", "outdoors"], hoursSincePosted: 2)
                        .padding(.bottom)
                }
            }
        }
        .navigationBarTitle("")
        .navigationBarHidden(true)
    }
}

struct ISOView_Previews: PreviewProvider {
    static var previews: some View {
        ISOView()
    }
}
