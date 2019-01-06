//
//  ViewController.swift
//  KindleReadingTime
//
//  Created by Brent Beer on 1/5/19.
//  Copyright © 2019 brntbeer. All rights reserved.
//

import UIKit

class Book {
    let title: String
    let author: String
    let pages: [Page]

    init(title: String, author: String, pages: [Page]){
        self.title = title
        self.author = author
        self.pages = pages
    }
}

class Page {
    let number: Int
    let text: String

    init(number: Int, text: String){
        self.number = number
        self.text = text
    }
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        view.backgroundColor = .red

        let page1 = Page(number: 1, text: "Text for first page1")
        let page2 = Page(number: 2, text: "Text for page 2")

        let pages = [page1, page2]

        let book = Book(title: "Steve Jobs", author: "Walter Isaacson", pages: pages)

        let firstpage = book.pages[0]
    }

}

