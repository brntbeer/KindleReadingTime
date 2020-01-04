//
//  PageCell.swift
//  KindleReadingTime
//
//  Created by Brent Beer on 1/4/20.
//  Copyright © 2020 brntbeer. All rights reserved.
//

import UIKit
class PageCell: UICollectionViewCell {

  //create subview of UILabel
  let textLabel: UILabel = {
    let label = UILabel()
    label.text = "SOME TEXT FOR OUR LABEL SOME TEXT FOR OUR LABEL SOME TEXT FOR OUR LABEL SOME TEXT FOR OUR LABEL SOME TEXT FOR OUR LABEL SOME TEXT FOR OUR LABEL "
    label.backgroundColor = .green
    label.translatesAutoresizingMaskIntoConstraints = false
    label.numberOfLines = 0
    return label
  }()

  override init(frame:CGRect) {
    super.init(frame: frame)

    backgroundColor = .yellow

    addSubview(textLabel)
    //textLabel.frame = CGRect(x: 0, y: 0, width: 100, height: 200)
    textLabel.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
    textLabel.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
    textLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    textLabel.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true


  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
