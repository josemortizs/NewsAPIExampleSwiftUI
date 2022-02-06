//
//  NewsArticleModalView.swift
//  NewsAPI
//
//  Created by Jose Manuel Ortiz Sanchez on 5/2/22.
//

import SwiftUI
import struct Kingfisher.KFImage

struct NewsArticleModalView: View {
    
    @Binding var article: Article?
    
    var body: some View {
        VStack(alignment: .center) {
            Text(article?.title ?? "")
                .bold()
                .multilineTextAlignment(.center)
                .padding()
            Divider()
            
            if let urlImage = URL(string: article?.urlToImage ?? "") {
                KFImage(urlImage)
                    .resizable()
                    .scaledToFill()
                    .frame(width: UIScreen.main.bounds.width * 0.9, height: 200)
                    .cornerRadius(20)
                    .shadow(radius: 5)
            } else {
                Image(systemName: "newspaper")
                    .resizable()
                    .scaledToFill()
            }
            
            Divider()
            
            
            Text(article?.content ?? "")
                .padding()
                .multilineTextAlignment(.center)
                .lineLimit(10)
            Spacer()
            
        }.frame(minHeight: UIScreen.main.bounds.height * 0.7)
    }
}

//struct NewsArticleModalView_Previews: PreviewProvider {
//    static var previews: some View {
//        NewsArticleModalView(article: articleMock)
//    }
//}
