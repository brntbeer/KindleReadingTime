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

      //setup cells to be of UITableViewCells that later get dequeued
      tableView.register(BookCell.self, forCellReuseIdentifier: "cellId")

      //remove all unecessary rows that aren't setup from UITableView
      tableView.tableFooterView = UIView()

      navigationItem.title = "Kindle Reading Time"

      setupBooks()
    }

  //  set up rows to be of a certain height
  override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 100
  }

  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath)

    //we want to grab the book that would be at each row in the indexPath
//    let book = books?[indexPath.row]
//
//    //each cell has a dynamic label from the book list.
//    cell.textLabel?.text = book?.title
//    // reminder: the ? here because book here is an optional value.
//    cell.imageView?.image = book?.image

    return cell
  }

  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    //"if let" unwrapping syntax because when the application starts up the count is 0. after the view finishes loading we have the number of books.
    // When the view finishes reloading itself, we have this proper count
    if let count = books?.count {
      return count
    }
    return 0
  }

  func setupBooks() {
    let page1 = Page(number: 1, text: "Text for book1 page 1")
    let page2 = Page(number: 2, text: "Text for book1 page 2")

    let pages = [page1, page2]

    //type `image literal` to get images here or the actual syntax #imageLiteral(resourceName: "steve_jobs")
    // or go into the media library (+ sign in upper right corner
    // and search for `steve_jobs` or any name of image asset
    let book = Book(title: "Steve Jobs", author: "Walter Isaacson", image: #imageLiteral(resourceName: "steve_jobs"), pages: pages)


    let book2 = Book(title: "Bill Gates: A Biography", author: "Michael Becraft", image: #imageLiteral(resourceName: "bill_gates"), pages: [
      Page(number: 1, text: "Text in book2 for page 1"),
      Page(number: 2, text: "Text in book2 for page 2"),
      Page(number: 3, text: "Text in book2 for page 3"),
      Page(number: 4, text: "Text in book2 for page 4"),

      ])
    self.books = [book, book2]

  }

}

