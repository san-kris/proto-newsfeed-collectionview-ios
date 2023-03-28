//
//  NewsFeedViewController.swift
//  proto-newsfeed-collectionview-ios
//
//  Created by Santosh Krishnamurthy on 3/28/23.
//

import UIKit

class NewsFeedViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {

    let cellID = "cellID"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupCollectionView()
        setupNavigationBar()
        
        collectionView.register(FeedCell.self, forCellWithReuseIdentifier: cellID)
    }
    
    func setupNavigationBar() -> Void {
        // set bar title
        navigationItem.title = "Feed"
        // set the bar size
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    fileprivate func setupCollectionView() {
        // Do any additional setup after loading the view.
        collectionView.backgroundColor = UIColor(white: 0.95, alpha: 1)
        // Allow cells to bounce in the view
        collectionView.alwaysBounceVertical = true
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! FeedCell
        cell.setupView()
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width , height: 300)
    }

    // Method is called when 
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        collectionView.collectionViewLayout.invalidateLayout()
    }


}
