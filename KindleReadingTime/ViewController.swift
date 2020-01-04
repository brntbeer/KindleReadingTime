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

  //this basically functions as "int main" if this was C++
    override func viewDidLoad() {
      super.viewDidLoad()

      //setup cells to be of UITableViewCells that later get dequeued
      tableView.register(BookCell.self, forCellReuseIdentifier: "cellId")

      //remove all unecessary rows that aren't setup from UITableView
      tableView.tableFooterView = UIView()

      navigationItem.title = "Kindle Reading Time"

      // Program order:
      // 1) setupbooks
      //   - setup books will finish, then the override functions are called
      // 2) it figures out how many rows we have (numberOfRowsInSection)
      // 3) it puts Cells in each row.
      // 4) It calculates the heightForRow
      //setupBooks()
      fetchBooks()
    }

  func fetchBooks() {
    if let url = URL(string: "https://letsbuildthatapp-videos.s3-us-west-2.amazonaws.com/kindle.json") {
      URLSession.shared.dataTask(with: url) { (data, response, error) in

        if let err = error {
          print("Failed to fetch external JSON Books", err)
          return
        }

        guard let data = data else { return }

        do {
          let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers)

         guard let bookDictionaries = json as? [[String: Any]]
          else { return }

          for bookDictionary in bookDictionaries {

            if let title = bookDictionary["title"] as? String, let author = bookDictionary["author"] as? String {
              let book = Book(title: title, author: author, image: #imageLiteral(resourceName: "steve_jobs"), pages: [])

              print(book.title)

              //self here because of retain cycles
              self.books?.append(book)
            }

          }
          print(json)

        } catch let jsonError {
          print("Failed to parse JSON properly", jsonError)
        }
      }.resume()

    }
  }

  //set up rows to be of a certain height
  override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 86
  }

  //This func makes sure that each row is an object of a type we specify
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath) as! BookCell

    //we want to grab the book that would be at each row in the indexPath
    let book = books?[indexPath.row]
    //render each cell's book as the book object
    cell.book = book

    return cell
  }

  //when we select a book, we need to trigger a new view to load.
  // essentially just hand this work over to a new sub=controller
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

    let selectedBook = self.books?[indexPath.row]

    let layout = UICollectionViewFlowLayout()
    let bookPagerController = BookPagerController (collectionViewLayout: layout)

    bookPagerController.book = selectedBook

    let navController = UINavigationController(rootViewController: bookPagerController)
    //allows the window to not "float" down below the top
    navController.modalPresentationStyle = .fullScreen
    self.present(navController, animated: true, completion: nil)
  }

  //This override is called before any of the rows get cells placed in them. But the "if let" doesnt have any books yet so it gets skipped
  //How many number of rows for the tableView do we need? This method figures that out based on `func setupBooks`
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

