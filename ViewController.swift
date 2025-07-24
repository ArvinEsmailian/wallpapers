import UIKit
import WebKit

class ViewController: UIViewController, WKNavigationDelegate {

    var webView: WKWebView!
    let refreshControl = UIRefreshControl()

    override func viewDidLoad() {
        super.viewDidLoad()
        let webConfiguration = WKWebViewConfiguration()
        webView = WKWebView(frame: .zero, configuration: webConfiguration)
        webView.navigationDelegate = self
        view = webView

        let urlString = "https://arvinesmaeilian.ir"
        if let url = URL(string: urlString) {
            let request = URLRequest(url: url)
            webView.load(request)
        }

        refreshControl.addTarget(self, action: #selector(refreshWebView), for: .valueChanged)
        webView.scrollView.refreshControl = refreshControl
    }

    @objc func refreshWebView() {
        webView.reload()
        refreshControl.endRefreshing()
    }
}