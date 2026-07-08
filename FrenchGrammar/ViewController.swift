import UIKit
import WebKit

final class ViewController: UIViewController {
    private var webView: WKWebView!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground

        let configuration = WKWebViewConfiguration()
        configuration.defaultWebpagePreferences.allowsContentJavaScript = true

        webView = WKWebView(frame: .zero, configuration: configuration)
        webView.translatesAutoresizingMaskIntoConstraints = false
        webView.allowsBackForwardNavigationGestures = false
        view.addSubview(webView)

        NSLayoutConstraint.activate([
            webView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            webView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            webView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            webView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])

        loadPracticeApp()
    }

    private func loadPracticeApp() {
        guard let appURL = Bundle.main.url(
            forResource: "index",
            withExtension: "html",
            subdirectory: "www"
        ) else {
            showMissingFileMessage()
            return
        }

        webView.loadFileURL(appURL, allowingReadAccessTo: appURL.deletingLastPathComponent())
    }

    private func showMissingFileMessage() {
        let html = """
        <!doctype html>
        <html>
        <body style="font-family:-apple-system;padding:24px;">
        <h1>French Grammar Practice</h1>
        <p>The bundled practice app could not be found.</p>
        </body>
        </html>
        """
        webView.loadHTMLString(html, baseURL: nil)
    }
}
