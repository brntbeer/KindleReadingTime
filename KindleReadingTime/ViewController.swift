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

    init(title: String, author: String){
        self.title = title
        self.author = author
    }
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        view.backgroundColor = .red

        let book = Book(title: "Steve Jobs", author: "Walter Isaacson")
        //print(book.title, book.author)
        print("Title: \(book.title) and Author: \(book.author)")

    }

}

