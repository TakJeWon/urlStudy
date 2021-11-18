//
//  URLSessionViewController.swift
//  urlStudy
//
//  Created by Tak_iMac on 2021/11/18.
//
import UIKit

class URLSessionViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var articles = [Article]()
    var model = ArticleModel()
    
    let cellIdetifier = "ArticleCell"
    
    override func  viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        //do any additional setup after loading the view.
        model.delegate = self
        model.getArticles()
    }
}

extension URLSessionViewController: ArticlemodelProtocol {
    
    //MARK: ArticleModelProtocol functions
    func articlesRetrieved(articles: [Article]) {
        print("articles retrieved from article model!")
        self.articles = articles
        tableView.reloadData()
    }
}

extension URLSessionViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.articles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let articleCell = tableView.dequeueReusableCell(withIdentifier: self.cellIdetifier , for: indexPath) as? ArticleTableViewCell else { return UITableViewCell() }
        
        let article = self.articles[indexPath.row]
        
        articleCell.displayArticle(article: article)
        
        return articleCell
    }
}
