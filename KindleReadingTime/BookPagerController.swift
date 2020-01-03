//
//  BookPagerController.swift
//  KindleReadingTime
//
//  Created by Brent Beer on 1/3/20.
//  Copyright © 2020 brntbeer. All rights reserved.
//

import UIKit
class BookPagerController: UICollectionViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    //defaults to black
    collectionView?.backgroundColor = .white

    navigationItem.title = "Book"

    collectionView?.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cellId")
  }

  override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 10
  }

  override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath)

    cell.backgroundColor = .red


    return cell
  }
}