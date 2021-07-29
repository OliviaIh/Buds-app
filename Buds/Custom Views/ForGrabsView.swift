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
    
    @EnvironmentObject var authViewModel:UserAuthViewModel
    
    var body: some View {
        Button("temporary sign out") {
            authViewModel.signOut()
        }
        .buttonStyle(WhiteTextTealBackgroundButton(width: 300, height: 100))
    }
}

struct ForGrabsView_Previews: PreviewProvider {
    static var previews: some View {
        ForGrabsView()
    }
}
