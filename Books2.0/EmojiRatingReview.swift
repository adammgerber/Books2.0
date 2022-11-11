//
//  EmojiRatingReview.swift
//  Books2.0
//
//  Created by Adam Gerber on 11/11/2022.
//

import SwiftUI

struct EmojiRatingReview: View {
    
    let rating: Int16
    
    var body: some View {
        switch rating{
        case 1:
            Text("1")
        case 2:
            Text("2")
        case 3:
            Text("3")
        case 4:
            Text("4")
        default:
            Text("5")
        }
    }
}

struct EmojiRatingReview_Previews: PreviewProvider {
    static var previews: some View {
        EmojiRatingReview(rating: 3)
    }
}
