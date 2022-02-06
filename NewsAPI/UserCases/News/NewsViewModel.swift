//
//  NewsViewModel.swift
//  NewsAPI
//
//  Created by Jose Manuel Ortiz Sanchez on 5/2/22.
//

import Foundation

final class NewsViewModel: ObservableObject {
    
    @Published var news: News?
    @Published var showError: Bool = false
    @Published var errorMessage: String = "Algo ha ido mal..."
    
    let newsRepository = NewsRepository()
    let newsLocal = NewsLocal()
    
    public func getNews(search: String) {
        
        if news == nil { self.news = self.newsLocal.getLocalNews() }
        
        newsRepository.getNews(search: search) { data, error in
            
            if data != nil {
                self.news = data
                self.newsLocal.setLocalNews(news: data!)
            }
            
            if error != nil {
                switch error {
                case .DESERIALIZING_ERROR:
                    self.errorMessage = "Ha habido un error des-serializando los datos recibidos, ponte en contacto con tu proveedor"
                    self.showError.toggle()
                case .NO_GET_A_200_RESPONSE:
                    self.errorMessage = "Hay algunos datos que no están siendo correctamente enviados, ponte en contacto con tu porveedor."
                    self.showError.toggle()
                default:
                    self.errorMessage = "Estamos teniendo problemas de conexión, revísala e inténtalo de nuevo más tarde"
                    self.showError.toggle()
                }
            }
        }
    }
}
