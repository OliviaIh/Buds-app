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
            
            
            // feed
            ScrollView {
                ForEach(0..<100) { num in
                    Text("\(num)")
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
