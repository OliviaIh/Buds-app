//
//  CommonComponents.swift
//  Buds
//
//  Created by Olivia Ih on 8/6/21.
//

/*
 Common components/views that are used in various views
 */


import SwiftUI


/*
 Looks the same as TealRectangleTextFieldStyle except there's
 a magnifying glass SFSymbol next to the TextField and the
 TextField's placeholder text is "search".
 */
struct SearchBar: View {
    
    @Binding var searchInquiry:String
    
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundColor(Color("Dark Teal"))
                .padding(.leading)
            TextField("search", text: $searchInquiry)
                .padding(.vertical, 15)
                .font(.custom("Helvetica Neue", size: 18))
        }
        .overlay(Rectangle().stroke(Color("Teal"), lineWidth: 2))
        .padding()
    }
}


/*
 Left-justified title meant for tops of pages
 */
struct TopLeftTitle: View {
    
    var title:String
    
    var body: some View {
        HStack {
            Text(title)
                .font(.custom("Avenir Medium", size: 48))
                .foregroundColor(Color("Dark Teal"))
                .padding([.leading, .top])
            Spacer()
        }
    }
}


/*
 VStack of TopLeftTitle and SearchBar for tops of pages
 */
struct TitleAndSearchBar: View {
    
    var title:String
    @Binding var searchInquiry:String
    
    var body: some View {
        VStack {
            TopLeftTitle(title: title)
            SearchBar(searchInquiry: $searchInquiry)
        }
    }
}


/*
 Default/placeholder profile pic
 */
struct ProfilePicPlaceholder: View {
    
    var size:CGFloat
    
    var body: some View {
        ZStack {
            Circle()
                .frame(width: size, height: size)
                .foregroundColor(Color("Red Orange"))
            Image(systemName: "person.crop.circle")
                .foregroundColor(Color("Orange"))
                .font(.system(size: size + 4, weight: .thin))
        }
    }
}


//struct TopLeftTitle_Previews: PreviewProvider {
//    static var previews: some View {
//        TopLeftTitle(title: "blah")
//    }
//}
