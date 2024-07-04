import UIKit

class NewsListTableViewController: UITableViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    private func setup() {
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
        let url = URL(string: "https://newsapi.org/v2/top-headlines?country=br&apiKey=676d68f0e1e241e9aa699d0b5fa4f37c")!
        
        WebService().getArticles(url: url) { _ in
            
        }
    }
}
