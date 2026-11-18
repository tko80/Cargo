import SwiftUI
import WebKit

struct ContentView: View {
    var body: some View {
        CargoWebView()
            .ignoresSafeArea(edges: [.top, .bottom])
    }
}

struct CargoWebView: UIViewRepresentable {
    func makeUIView(context: Context) -> WKWebView {
        let configuration = WKWebViewConfiguration()
        configuration.websiteDataStore = .default()
        let webView = WKWebView(frame: .zero, configuration: configuration)
        webView.scrollView.contentInsetAdjustmentBehavior = .never
        webView.isOpaque = false
        webView.backgroundColor = UIColor(red: 0.96, green: 0.97, blue: 0.99, alpha: 1)
        if let fileURL = Bundle.main.url(forResource: "index", withExtension: "html") {
            webView.loadFileURL(fileURL, allowingReadAccessTo: fileURL.deletingLastPathComponent())
        }
        return webView
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {}
}
