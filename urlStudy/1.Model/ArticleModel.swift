//
//  ArticleModel.swift
//  urlStudy
//
//  Created by Tak_iMac on 2021/11/18.
//

import Foundation

protocol ArticlemodelProtocol {
    func articlesRetrieved(articles: [Article])
}

class ArticleModel{
    
    var delegate: ArticlemodelProtocol?
    
    func getArticles() {
        
        // 1. 요청할 url을 string으로
        let urlString = "https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=bb8e4fcfd4bc4ea4a1ba2b1b105a592f"
        
        // 2. url instance 생성
        let url = URL(string: urlString)
        
        // 3. 해당 url이 만약 nil이면 중지
        guard url != nil else {
            print("Couldn't create url objcet")
            return
        }

        //4. url session 만들기
        let session = URLSession.shared
        
        //5. url sessiond으로 dataTask 만들기
        let dataTask = session.dataTask(with: url!) { (data, response, error) in
            //error 없고 data를 성공적으로 불러오면
            if error == nil && data != nil {
                //json -> swift 객체
                let decoder = JSONDecoder()
                
                // 예기치 못한 error 예방
                do {
                    let articleService = try decoder.decode(ArticleService.self, from: data!)
                    DispatchQueue.main.sync {
                        self.delegate?.articlesRetrieved(articles: articleService.articles!)
                    }
                }
                catch {
                    print("Error parsing the json")
                }
            }
        }
        
        dataTask.resume()
    }
}
