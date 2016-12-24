/*
 Copyright 2015 XWebView

 Licensed under the Apache License, Version 2.0 (the "License");
 you may not use this file except in compliance with the License.
 You may obtain a copy of the License at

 http://www.apache.org/licenses/LICENSE-2.0

 Unless required by applicable law or agreed to in writing, software
 distributed under the License is distributed on an "AS IS" BASIS,
 WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 See the License for the specific language governing permissions and
 limitations under the License.
*/

import UIKit
import WebKit
import XWebView

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        let webview = WKWebView(frame: view.frame, configuration: WKWebViewConfiguration())
        webview.scrollView.bounces = false
        view.addSubview(webview)

        webview.loadPlugin(Echo(prefix: nil), namespace: "sample.Echo")
        webview.loadPlugin(HelloWorld(), namespace: "sample.hello")
        webview.loadPlugin(Vibrate(), namespace: "sample.vibrate")

        let bundle = Bundle.main
        if let url = bundle.url(forResource: "index", withExtension: "html") {
            webview.loadFileURL(url, allowingReadAccessTo: bundle.resourceURL!)
        }
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
}
