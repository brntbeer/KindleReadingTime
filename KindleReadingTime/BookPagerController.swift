//
//  BookPagerController.swift
//  KindleReadingTime
//
//  Created by Brent Beer on 1/3/20.
//  Copyright © 2020 brntbeer. All rights reserved.
//

import UIKit
class BookPagerController: UICollectionViewController, UICollectionViewDelegateFlowLayout {

  //has to be var and optional instead of let, because at initialization it will be nil
  var book: Book?

  override func viewDidLoad() {
    super.viewDidLoad()
    //defaults to black
    collectionView?.backgroundColor = .white

    navigationItem.title = self.book?.title

    collectionView?.register(PageCell.self, forCellWithReuseIdentifier: "cellId")

    //downcasting basically: https://stackoverflow.com/questions/25708649/downcasting-optionals-in-swift-as-type-or-as-type
    let layout = collectionView?.collectionViewLayout as? UICollectionViewFlowLayout
    layout?.scrollDirection = .horizontal
    layout?.minimumLineSpacing = 0

    collectionView?.isPagingEnabled = true

    self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Close", style: .plain, target: self, action: #selector(handleCloseBook))
  }

  @objc func handleCloseBook() {
    dismiss(animated:true, completion: nil)
  }

  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    //34 for status bar, 88 for nav?
    return CGSize(width: view.frame.width, height: view.frame.height - 34 - 88)
  }

  override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 10
  }

  override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath)

    /*if indexPath.item % 2 == 0 {
      cell.backgroundColor = .red
    } else {
      cell.backgroundColor = .blue
    }*/

    return cell
  }
}
