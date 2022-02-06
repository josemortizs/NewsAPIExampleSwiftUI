//
//  NewsView.swift
//  NewsAPI
//
//  Created by Jose Manuel Ortiz Sanchez on 5/2/22.
//

import SwiftUI

struct NewsView: View {
    
    @StateObject var viewmodel = NewsViewModel()
    
    @State var articleSelected: Article?
    @State var showArticle: Bool = false
    @State var textToSearch: String = ""
    
    var body: some View {
        NavigationView {
            VStack(alignment: .center) {
                emptyList
                newsList
            }
            .onAppear {
                viewmodel.getNews(search: "apple")
            }.alert(isPresented: self.$viewmodel.showError) {
                Alert(title: Text(self.viewmodel.errorMessage), dismissButton: .cancel())
            }
        }.searchable(text: self.$textToSearch)
    }
    
    var newsList: some View {
        if let news = viewmodel.news?.articles {
            return AnyView(
                List(news.sorted(by: { $0.publishedAt ?? Date() > $1.publishedAt ?? Date() }).filter({
                    textToSearch != "" ?  $0.title?.contains(self.textToSearch) ?? false : true
                }), id: \.publishedAt) { article in
                    NewsItemView(image: article.urlToImage ?? "", title: article.title ?? "", description: article.description ?? "")
                        .onTapGesture {
                            self.articleSelected = article
                            self.showArticle.toggle()
                        }
                }.sheet(isPresented: self.$showArticle, content: {
                    NewsArticleModalView(article: self.$articleSelected)
                })
            )
        } else {
            return AnyView(EmptyView())
        }
    }
    
    var emptyList: some View {
        if viewmodel.news == nil {
            return AnyView(
                Text("Estamos cargando sus noticias, sea paciente...")
                    .font(Font.title)
                    .lineLimit(3)
                    .padding(.top, 50)
            )
        } else {
            return AnyView(EmptyView())
        }
    }
}

struct NewsView_Previews: PreviewProvider {
    static var previews: some View {
        NewsView()
    }
}
