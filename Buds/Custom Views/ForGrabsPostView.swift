//
//  ForGrabsPostView.swift
//  Buds
//
//  Created by Olivia Ih on 8/13/21.
//

import SwiftUI

struct ForGrabsPostView: View {
    
    var posterName:String
    var posterInfoLeft:String   // number of giveaways
    var posterInfoRight:String  // rating
    var distance:Double
    var waitlistLength:Int
    var collectBy:String
    var title:String
    var description:String
    var tags:[String]
    var hoursSincePosted:Int
    
    private let pictureHeight = UIScreen.main.bounds.width - 40
    private let collapsedHeight:CGFloat = 80
    
    @State private var infoBarExpanded:Bool = false
    
    var body: some View {
        VStack {
            PosterInfo(posterName: posterName, infoLeft: posterInfoLeft, infoRight: posterInfoRight)
            
            ZStack(alignment: .bottomTrailing) {
                Image("couch")
                    .resizable()
                    .frame(height: pictureHeight)
                    .aspectRatio(contentMode: .fit)
                
                // info bar
                ZStack(alignment: .top) {
                    Rectangle()
                        .frame(height: getInfoBarHeight())
                        .foregroundColor(Color("Dark Teal").opacity(0.8))
                    
                    // gray from figma for info bar background: Color(red: 0.196, green: 0.169, blue: 0.169, opacity: 0.8)
                    
                    VStack(alignment: .leading, spacing: 10) {
                        // info that's always visible
                        HStack {
                            VStack(alignment: .leading) {
                                Text(String(distance.rounded()) + " mi  |  " + getWaitlistLinfo())
                                    .foregroundColor(.white)
                                    .font(.custom("Avenir", size: 14))
                                
                                Text(title)
                                    .foregroundColor(.white)
                                    .font(.custom("Avenir Black", size: 20))
                                    .lineLimit(1)

                                Text("collect by " + collectBy)
                                    .foregroundColor(.white)
                                    .font(.custom("Avenir", size: 14))
                            }
                            
                            Spacer()
                        }
                        
                        // only visible when expanded
                        if infoBarExpanded {
                            Text(description)
                                .foregroundColor(.white)
                                .font(.custom("Helvetica Neue", size: 14))
                                .frame(height: getInfoBarHeight() - collapsedHeight - 50, alignment: .top)
                            
                            Text("Tags: " + tags.joined(separator: ", "))
                                .foregroundColor(.white)
                                .font(.custom("Helvetica Neue Italic", size: 14))
                        }
                    }
                    .padding(.top, 6)
                    .padding(.horizontal)

                }
                
                // more info
                Button(action: {
                    infoBarExpanded.toggle()
                }, label: {
                    if infoBarExpanded {
                        Text("collapse")
                            .foregroundColor(.white)
                            .font(.custom("Helvetica Neue Medium", size: 12))
                    }
                    else {
                        Text("more info")
                            .foregroundColor(.white)
                            .font(.custom("Helvetica Neue Medium", size: 12))
                    }
                })
                .padding([.bottom, .trailing], 10)
            }

            PostToolbar(hoursSincePosting: hoursSincePosted)
        }
        .padding(.horizontal)
        .animation(.easeOut)
        .transition(.slide)
    }
    
    
    private func getWaitlistLinfo() -> String {
        if waitlistLength == 1 {
            return "1 person on waitlist"
        }
        else {
            return String(waitlistLength) + " people on waitlist"
        }
    }
    
    
    private func getInfoBarHeight() -> CGFloat {
        if infoBarExpanded {
            return 0.75 * pictureHeight
        }
        else {
            return collapsedHeight
        }
    }
}

struct ForGrabsPostView_Previews: PreviewProvider {
    static var previews: some View {
        ForGrabsPostView(posterName: "Poster's Name", posterInfoLeft: "45 giveaways", posterInfoRight: "4.5 stars", distance: 3, waitlistLength: 1, collectBy: "8:30 PM", title: "Couch", description: "For now, I think just a text box of what specifications the item is will suffice. We can just add a blurb of what may help, like size specifications & what it was used for etc. For now, I think just a text box of what specifications the item is will suffice. We can just add a blurb of what may help, like size specifications & what it was used for etc.For now, I think just a text box of what specifications the item is will suffice. We can just add a blurb of what may help, like size specifications & what it was used for etc. ", tags: ["furniture"], hoursSincePosted: 2)
    }
}
