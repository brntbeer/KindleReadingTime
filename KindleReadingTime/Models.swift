//
//  Models.swift
//  KindleReadingTime
//
//  Created by Brent Beer on 1/18/19.
//  Copyright © 2019 brntbeer. All rights reserved.
//

import UIKit

class Book {
  let title: String
  let author: String
  let image: UIImage
  let pages: [Page]

  init(title: String, author: String, image: UIImage, pages: [Page]){
    self.title = title
    self.author = author
    self.image = image
    self.pages = pages
  }
  init(dictionary: [String: Any]) {
    self.title = ""
    self.author = ""
    self.image = #imageLiteral(resourceName: "steve_jobs")
    pages = []
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
