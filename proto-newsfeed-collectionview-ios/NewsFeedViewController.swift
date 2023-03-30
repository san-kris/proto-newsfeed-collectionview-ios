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
        cell.delegate = self
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
    
    var zoomView: UIImageView?
    var blackBackgroundView: UIView?
    var feedImageSuperviewRect: CGRect?

    func showImgaeFullScreen(imageView: UIImageView) -> Void {
        
        if let convertFrame = imageView.superview?.convert(imageView.frame, to: nil){
            feedImageSuperviewRect = convertFrame
            
            // setup Zoom View
            zoomView = UIImageView()
            guard let zoomView else {return}
            zoomView.frame = convertFrame
            zoomView.image = imageView.image
            zoomView.contentMode = .scaleAspectFill
            zoomView.clipsToBounds = true
            view.addSubview(zoomView)
            
            if let window = UIApplication.shared.connectedScenes.compactMap({($0 as? UIWindowScene)?.keyWindow}).first {
                blackBackgroundView = UIView()
                guard let blackBackgroundView else {return}
                blackBackgroundView.frame = window.frame
                blackBackgroundView.backgroundColor = .black
                blackBackgroundView.alpha = 0
                window.addSubview(blackBackgroundView)
                window.addSubview(zoomView)
                
                UIView.animate(withDuration: 0.75, delay: 0, options: .curveEaseOut) {
                    // find the acpect ratio of the original frame
                    let aspectRatio = convertFrame.height / convertFrame.width
                    // calculate the new height
                    let newHeight = aspectRatio * window.frame.width
                    
                    let newY = (window.frame.height / 2) - (zoomView.frame.height / 2)
                    
                    zoomView.frame = CGRect(x: 0, y: newY, width: window.frame.width, height: newHeight)
                    
                    blackBackgroundView.alpha = 1
                } completion: { (didComplete) in
                    print("Zoom In Animation completed")
                    zoomView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.handleTapFullScreenImage)))
                    zoomView.isUserInteractionEnabled = true
                }

            }
            
            
        }
    }
    
    @objc func handleTapFullScreenImage(gesture: UITapGestureRecognizer) -> Void {
        print("Animation func")
        guard let feedImageSuperviewRect else {return}
        
        UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseIn) {
            self.zoomView?.frame = feedImageSuperviewRect
            self.blackBackgroundView?.alpha = 0
        } completion: { (didComplete) in
            print("Zoom Out Animation Completed")
            self.zoomView?.removeFromSuperview()
            self.blackBackgroundView?.removeFromSuperview()
        }

    }

}
