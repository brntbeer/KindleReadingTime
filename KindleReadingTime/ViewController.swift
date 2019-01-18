//
//  ViewController.swift
//  KindleReadingTime
//
//  Created by Brent Beer on 1/5/19.
//  Copyright © 2019 brntbeer. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

  var books: [Book]?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        view.backgroundColor = .red

      setupBooks()
    }

  func setupBooks() {
    let page1 = Page(number: 1, text: "Text for book1 page 1")
    let page2 = Page(number: 2, text: "Text for book1 page 2")

    let pages = [page1, page2]

    let book = Book(title: "Steve Jobs", author: "Walter Isaacson", pages: pages)


    let book2 = Book(title: "Bill Gates: A Biography", author: "Michael Becraft", pages: [
      Page(number: 1, text: "Text in book2 for page 1"),
      Page(number: 2, text: "Text in book2 for page 2"),
      Page(number: 3, text: "Text in book2 for page 3"),
      Page(number: 4, text: "Text in book2 for page 4"),

      ])
    self.books = [book, book2]

    guard let books = self.books else { return }

    for book in books {
      for page in book.pages {
        print(page.text)
      }
    }
    //      if let unwrappedBooks = self.books {
    //        for book in unwrappedBooks {
    //            for page in book.pages {
    //                print(page.text)
    //            }
    //        }
    //      }

  }

}

