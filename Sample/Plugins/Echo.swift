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

import XWebView

class Echo: NSObject, XWVScripting {
    dynamic var prefix: String = ""

    func echo(message: String, callback: XWVScriptObject) {
        callback.call(arguments: [prefix + message], resultHandler: nil)
    }

    init(prefix: AnyObject?) {
        if prefix is String {
            self.prefix = prefix as! String
        } else if let num = prefix as? NSNumber {
            self.prefix = num.stringValue
        }
    }
    class func isSelectorForConstructor(selector: Selector) -> Bool {
        return selector == Selector("initWithPrefix:")
    }
}
