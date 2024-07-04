import UIKit

class NewsListTableViewController: UITableViewController {
    
    private var articlelistVM: ArticleListViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    private func setup() {
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
        let url = URL(string: "https://newsapi.org/v2/top-headlines?country=br&apiKey=676d68f0e1e241e9aa699d0b5fa4f37c")!
        
        WebService().getArticles(url: url) { articles in
            if let articles = articles {
                self.articlelistVM = ArticleListViewModel(articles: articles)
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        self.articlelistVM?.numberOfSections ?? 0
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.articlelistVM?.numberOfRowsInSection(section) ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ArticleTableViewCell", for: indexPath) as? ArticleTableViewCell else {
            fatalError("ArticleTableViewCell not found")
        }
        
        let articleVM = self.articlelistVM?.articleAtIndex(indexPath.row)
        
        cell.titleLabel.text = articleVM?.title
        cell.authorLabel.text = articleVM?.author
        
        return cell
    }

}
