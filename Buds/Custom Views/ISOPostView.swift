//
//  ISOPostView.swift
//  Buds
//
//  Created by Olivia Ih on 8/13/21.
//

import SwiftUI

struct ISOPostView: View {
    
    var posterName:String
    var posterInfoLeft:String   // distance
    var posterInfoRight:String  // need by
    var description:String
    var tags:[String]
    var hoursSincePosted:Int
    
    var body: some View {
        VStack {
            ZStack {
                RoundedRectangle(cornerRadius: 5)
                    .frame(height: 175, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .foregroundColor(.white)
                    .shadow(color: Color("Light Gray"), radius: 3, x: 0, y: 3)
                
                VStack(alignment: .leading) {
                    PosterInfo(posterName: posterName, infoLeft: posterInfoLeft, infoRight: posterInfoRight)
                        .padding(.leading, 5)
                    
                    Text(description)
                        .foregroundColor(Color("Dark Teal"))
                        .font(.custom("Helvetica Neue", size: 13))
                        .multilineTextAlignment(.leading)
                        .padding([.leading, .bottom], 5)
                        .padding(.trailing, 10)
                        .frame(height: 90, alignment: .topLeading)
                        .lineLimit(5)
                        .lineSpacing(1.5)
                    
                    Text("Tags: " + tags.joined(separator: ", "))
                        .foregroundColor(Color("Dark Teal"))
                        .font(.custom("Helvetica Neue Italic", size: 13))
                        .padding(.leading, 5)
                        .padding(.trailing, 10)
                }
            }
            
            PostToolbar(hoursSincePosting: 2)
        }
        .padding(.horizontal, 15)
    }
}

struct ISOPostView_Previews: PreviewProvider {
    static var previews: some View {
        ISOPostView(posterName: "Poster's Name", posterInfoLeft: "3 mi", posterInfoRight: "Need by Tues, July 12 at 8 PM", description: "Poster can put description here of what they’re looking for. we’ll keep it simple (just a text box), but like the for grabs description box, we’ll put suggestions of what can be useful (description of item, where/how far they’re willing to go to pick up, etc).", tags: ["furniture", "outdoors"], hoursSincePosted: 2)
    }
}
