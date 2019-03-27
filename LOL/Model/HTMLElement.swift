//
//  HTMLElement.swift
//  LOL
//
//  Created by fsc on 2019/3/22.
//  Copyright © 2019 fsc. All rights reserved.
//

import Foundation

class HTMLElement {
    
    let name: String
    let text: String?
    
    lazy var asHTML: () -> String = {
        if let text = self.text {
            return "<\(self.name)>\(text)/\(self.name)"
        } else {
            return "<\(self.name)>"
        }
    }
    
    init(name: String, text: String? = nil) {
        self.name = name
        self.text = text
    }
    
    deinit {
        print("\(name) is being deinitialized")
    }
    
}
