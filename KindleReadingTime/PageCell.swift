//
//  PageCell.swift
//  KindleReadingTime
//
//  Created by Brent Beer on 1/4/20.
//  Copyright © 2020 brntbeer. All rights reserved.
//

import UIKit
class PageCell: UICollectionViewCell {

  override init(frame:CGRect) {
    super.init(frame: frame)

    backgroundColor = .yellow
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
