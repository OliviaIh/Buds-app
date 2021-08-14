//
//  NewISOView.swift
//  Buds
//
//  Created by Andrea Wang Admin on 8/11/21.
//

import SwiftUI

struct NewISOView: View {
    
    @EnvironmentObject var postingViewModel:PostingViewModel
    
    private let buttonWidth:CGFloat = (UIScreen.main.bounds.width - 30) / 2
    private let buttonHeight:CGFloat = 60
    
    @State private var description:String = ""
    @State private var selectedDate = Date()
    @State private var tags:[String] = []
    
    @State private var postButtonLabel = "POST"
    
    var body: some View {
        
        ScrollView(showsIndicators: false) {
            TopLeftTitle(title: "new ISO post")
            
            VStack {
                // Description textfield
                PostInfoFieldLabel(label: "Description")
                TextEditor(text: $description)
                    .font(.custom("Helvetica Neue", size: 14))
                    .foregroundColor(Color("Dark Teal"))
                    .padding(.horizontal, 5)
                    .frame(height: 150)
                    .border(Color("Teal"), width: 2)
                    .padding(.horizontal)
                
                // Collect by
                PostInfoFieldLabel(label: "Need By")
                DatePicker("Select date and time:", selection: $selectedDate, in: Date()..., displayedComponents: [.date, .hourAndMinute])
                    .padding(.horizontal)
                    .font(.custom("Avenir", size: 16))
                    .foregroundColor(Color("Dark Teal"))
                    .accentColor(Color("Teal"))
                
                // Tags
                PostInfoFieldLabel(label: "Tags")
                FilterButtonsView(toggledButtons: $tags)
            }
            .padding(.bottom, 40)
            
            Button(postButtonLabel) {
                postButtonLabel = "POSTING..."
                postingViewModel.postToISO(description: description, selectedDate: selectedDate, tags: tags) {
                    goForGrabs()    // see NewForGrabsView.swift
                }
            }
            .buttonStyle(WhiteTextTealBackgroundButton(width: buttonWidth, height: buttonHeight))
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}

    
struct NewISOView_Previews: PreviewProvider {
    static var previews: some View {
        NewISOView()
    }
}
