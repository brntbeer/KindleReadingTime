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

        let page1 = Page(number: 1, text: "Text for book1 page 1")
        let page2 = Page(number: 2, text: "Text for book1 page 2")

        let pages = [page1, page2]

        let book = Book(title: "Steve Jobs", author: "Walter Isaacson", pages: pages)

        //let firstpage = book.pages[0]

        //if page2.text.contains("Text") {
        //    print(page2.text)
        //}
        
        for page in book.pages {
            if page.number == 1 {
              print(page.text)
            }
        }

        let book2 = Book(title: "Bill Gates: A Biography", author: "Michael Becraft", pages: [
            Page(number: 1, text: "Text in book2 for page 1"),
            Page(number: 2, text: "Text in book2 for page 2"),
            Page(number: 3, text: "Text in book2 for page 3"),
            Page(number: 4, text: "Text in book2 for page 4"),

            ])

        for book in [book, book2] {
            for page in book.pages {
                print(page.text)
            }
        }
    }

}

