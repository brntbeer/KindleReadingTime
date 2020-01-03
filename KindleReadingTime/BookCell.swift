//
//  BookCell.swift
//  KindleReadingTime
//
//  Created by Brent Beer on 12/23/19.
//  Copyright © 2019 brntbeer. All rights reserved.
//

import UIKit

//creating this class instead of just using UITableViewCell (which is more rigid) so that we have
// more freedom to define how we want the cell to look.
class BookCell: UITableViewCell {

  var book: Book? {
    didSet{
      coverImageView.image = book?.image
      titleLabel.text = book?.title
      authorLabel.text = book?.author
    }
  }

  private let coverImageView: UIImageView = {
    let imageView = UIImageView()
    //disable the old style of how we did our layouts
    imageView.translatesAutoresizingMaskIntoConstraints = false
    imageView.image = #imageLiteral(resourceName: "steve_jobs")
    return imageView
  }()

  private let titleLabel: UILabel = {
    let label = UILabel()
    label.text = "This is the text from the the book for the title in our cell"
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()

  private let authorLabel: UILabel = {
    let label = UILabel ()
    label.text = "this is the author name"
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()

  //almost auto-generated override and required init? methods just so our cell is able to render itself
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)

    addSubview(coverImageView)
    coverImageView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 8).isActive = true
    coverImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 8).isActive = true
    coverImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -8).isActive = true
    coverImageView.widthAnchor.constraint(equalToConstant: 50).isActive = true

    addSubview(titleLabel)
    //pin the title to wherever the right anchor of the image is+8
    titleLabel.leftAnchor.constraint(equalTo: coverImageView.rightAnchor, constant: 8).isActive = true
    titleLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -8).isActive = true
    titleLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
    titleLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: -10).isActive = true

    addSubview(authorLabel)
    authorLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 4).isActive = true
    authorLabel.leftAnchor.constraint(equalTo: coverImageView.rightAnchor, constant: 8).isActive = true
    authorLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -8).isActive = true
    authorLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

}
