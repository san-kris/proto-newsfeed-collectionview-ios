//
//  NewsFeedViewController.swift
//  proto-newsfeed-collectionview-ios
//
//  Created by Santosh Krishnamurthy on 3/28/23.
//

import UIKit

class NewsFeedViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {

    let cellID = "cellID"
    
    let posts = [
        Post(name: "Rhea", description: "Beast from the east.\n\nSay whaaaat??? "),
        Post(name: "Rohan", description: "This is a description of the profile. super long text. had new lines. \n\nWhat is going on here?"),
        Post(name: "Santosh", description: "old man with beard")
    ]
    
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
        return posts.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! FeedCell
        cell.post = posts[indexPath.row]
        cell.setupView()
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let minCellHeight = CGFloat(44 + 200 + 20 + 30)
        let desc = posts[indexPath.row].description
        let rect = NSString(string: desc).boundingRect(with: CGSize(width: view.frame.width - 10, height: CGFloat.greatestFiniteMagnitude),
                                                       options: NSStringDrawingOptions.usesLineFragmentOrigin,
                                                       attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14)],
                                                       context: nil)
        print(rect.height, rect.width)
        // Add 16 extra points to show the last text line from being cutoff
        return CGSize(width: view.frame.width , height: minCellHeight + rect.height + 16)
    }

    // Method is called when 
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        collectionView.collectionViewLayout.invalidateLayout()
    }


}
