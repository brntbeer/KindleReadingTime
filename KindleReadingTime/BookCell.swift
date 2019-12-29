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

  let coverImageView: UIImageView = {
    let imageView = UIImageView()
    imageView.backgroundColor = .red
    return imageView
  }()

  let titleLabel: UILabel = {
    let label = UILabel()
    label.text = "This is the text from the the book for the title in our cell"
    label.backgroundColor = .blue
    return label
  }()

  let authorLabel: UILabel = {
    let label = UILabel ()
    label.text = "this is the author name"
    label.backgroundColor = .green
    return label
  }()

  //almost auto-generated override and required init? methods just so our cell is able to render itself
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)

    backgroundColor = .yellow

    addSubview(coverImageView)

    addSubview(titleLabel)

    addSubview(authorLabel)
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

}
