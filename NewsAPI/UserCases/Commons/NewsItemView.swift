//
//  NewsItemView.swift
//  NewsAPI
//
//  Created by Jose Manuel Ortiz Sanchez on 5/2/22.
//

import SwiftUI
import struct Kingfisher.KFImage

struct NewsItemView: View {
    
    var image: String
    var title: String
    var description: String
    
    var body: some View {
        HStack {
            if let urlImage = URL(string: image) {
                KFImage(urlImage)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 64, height: 125)
                    .cornerRadius(20)
                    .shadow(radius: 5)
            } else {
                Image(systemName: "newspaper")
                    .resizable()
                    .scaledToFill()
            }
            
            Spacer()
            
            VStack(alignment: .leading) {
                Text(title).bold().lineLimit(2)
                    .padding(.bottom)
                Text(description).lineLimit(3)
            }.padding()
        }
        .frame(height: 150)
    }
}

struct NewsItemView_Previews: PreviewProvider {
    static var previews: some View {
        NewsItemView(image: "https://s.yimg.com/os/creatr-uploaded-images/2021-06/abb0de60-c831-11eb-9ebf-fd23496f2550", title: "The free trial of Apple Music was quietly reduced to a single month", description: "Since its debut in 2015, Apple Music has offered one of the more generous free trial periods in the streaming industry. As a first-time subscriber, you could use the platform to listen to music for free for up to three months before the company asked you to s…")
    }
}
