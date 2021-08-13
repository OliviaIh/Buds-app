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
            ScrollView {
                ForEach(0..<10) { _ in
                    ForGrabsPost()
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
