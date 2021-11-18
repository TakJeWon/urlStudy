//
//  ArticleTableViewCell.swift
//  urlStudy
//
//  Created by Tak_iMac on 2021/11/18.
//

import UIKit

class ArticleTableViewCell: UITableViewCell {
    
    @IBOutlet weak var headLineText: UILabel!
    @IBOutlet weak var headLineImage: UIImageView!
    
    var articleToDisplay: Article?
    
    func displayArticle(article:Article){
        articleToDisplay = article
        
        headLineText.text = articleToDisplay!.title
        
        // 이미지 url이 없는 기사가 있을 경우
        guard articleToDisplay!.urlToImage != nil else {
            return
        }
        
        let urlString = articleToDisplay!.urlToImage!
        let url = URL(string: urlString)
        
        guard url != nil else {
            print ("Couldn't create url objcet")
            return
        }
        
        let session = URLSession.shared
        
        let dataTask = session.dataTask(with: url!) { (data, response, error) in
            if (error == nil && data != nil) {
                if(self.articleToDisplay!.urlToImage == urlString){
                    DispatchQueue.main.sync {
                        self.headLineImage.image = UIImage(data: data!)
                    }
                }
            }
        }
        
        dataTask.resume()
    }
}
