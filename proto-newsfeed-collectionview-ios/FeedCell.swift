//
//  FeedCell.swift
//  proto-newsfeed-collectionview-ios
//
//  Created by Santosh Krishnamurthy on 3/28/23.
//

import UIKit

class FeedCell: UICollectionViewCell {
    
    var post: Post? {
        didSet{
            print("Post was set")
            guard let post else {return}
            nameLabel.text = post.name
            descriptionTextView.text = post.description
        }
    }
    
    lazy private var profileImageView: UIImageView =  {
        let iv = UIImageView(image: UIImage(systemName: "person.circle"))
        iv.contentMode = UIView.ContentMode.scaleAspectFit
        iv.backgroundColor = .red
        // create a tap gesture recognizer and add it to profile image
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleTapProfile))
        iv.addGestureRecognizer(tapGestureRecognizer)
        iv.isUserInteractionEnabled = true
        return iv
    }()
    
    // making profile image interactable
    @objc private func handleTapProfile(gesture: UITapGestureRecognizer){
        print("Profile Image Tapped")
    }
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "sample name"
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.backgroundColor = .blue
        return label
    }()
    
    private let statusLabel: UILabel = {
        let label = UILabel()
        label.text = "This is a status of the profile"
        label.font = UIFont.systemFont(ofSize: 10)
        label.textColor = .darkGray
        label.backgroundColor = .orange
        return label
    }()
    
    lazy private var titleStackView: UIStackView = {
        let sv = UIStackView(arrangedSubviews: [nameLabel, statusLabel])
        sv.axis = NSLayoutConstraint.Axis.vertical
        sv.distribution = UIStackView.Distribution.fillEqually
        return sv
    }()
    

    
    lazy private var profileStackView: UIView = {
        let sv = UIStackView(arrangedSubviews: [profileImageView, titleStackView])
        sv.backgroundColor = .green
        sv.axis = NSLayoutConstraint.Axis.horizontal
        sv.spacing = 8
        sv.layoutMargins = UIEdgeInsets(top: 4, left: 4, bottom: 4, right: 4)
        return sv
    }()
    
    private let descriptionTextView: UITextView = {
        let tv = UITextView()
        tv.text = "This is a description of the profile. super long text. had new lines \n\n. What is going on here?"
        tv.font = UIFont.systemFont(ofSize: 14)
        tv.textColor = .black
        tv.backgroundColor = .yellow
        tv.isScrollEnabled = false
        return tv
    }()
    
    private let feedImage: UIImageView = {
        let iv = UIImageView(image: UIImage(named: "Background-Euro"))
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        return iv
    }()
    
    let summaryLabel: UILabel = {
        let label = UILabel()
        label.textColor = .darkGray
        label.text = "100 Likes   10 Comments"
        label.font = UIFont.systemFont(ofSize: 12)
        label.backgroundColor = .yellow
        return label
    }()
    
    lazy var likeButton: UIButton = {
        let button = UIButton(type: UIButton.ButtonType.system)
        let attributedString = NSAttributedString(string: "Like", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14)])
        button.setAttributedTitle(attributedString, for: UIControl.State.normal)
        button.addTarget(self, action: #selector(handleLike), for: UIControl.Event.touchUpInside)
        return button
    }()
    
    @objc private func handleLike(sender: UIButton){
        print("Like button pressed")
    }
    
    lazy var commentButton: UIButton = {
        let button = UIButton(type: UIButton.ButtonType.system)
        let attributedString = NSAttributedString(string: "Comment", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14)])
        button.setAttributedTitle(attributedString, for: UIControl.State.normal)
        button.addTarget(self, action: #selector(handleComment), for: UIControl.Event.touchUpInside)
        return button
    }()
    
    @objc private func handleComment(sender: UIButton){
        print("Comment button pressed")
    }

    
    lazy var feedActionStackView : UIStackView = {
        let sv = UIStackView(arrangedSubviews: [likeButton, commentButton])
        sv.backgroundColor = .gray
        sv.axis = NSLayoutConstraint.Axis.horizontal
        sv.distribution = UIStackView.Distribution.fillEqually
        return sv
    }()
    
    lazy private var cellStackView: UIStackView = {
        
        let yellowView = UIView()
        yellowView.backgroundColor = .yellow
        let sv = UIStackView(arrangedSubviews: [profileStackView, descriptionTextView, feedImage, summaryLabel, feedActionStackView])
        sv.axis = NSLayoutConstraint.Axis.vertical
        return sv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
        
    func setupView() -> Void {
        addSubview(cellStackView)

        setupCellLayout()
        
    }
    
    fileprivate func setupCellLayout() {
        cellStackView.translatesAutoresizingMaskIntoConstraints = false
        cellStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5).isActive = true
        cellStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5).isActive = true
        cellStackView.topAnchor.constraint(equalTo: topAnchor, constant: 0).isActive = true
        cellStackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0).isActive = true
        
//        profileStackView.translatesAutoresizingMaskIntoConstraints = false
//        profileStackView.leadingAnchor.constraint(equalTo: cellStackView.leadingAnchor, constant: 0).isActive = true
//        profileStackView.trailingAnchor.constraint(equalTo: cellStackView.trailingAnchor, constant: -20).isActive = true

        
        profileImageView.translatesAutoresizingMaskIntoConstraints = false
//        profileImageView.leadingAnchor.constraint(equalTo: cellStackView.leadingAnchor, constant: 5).isActive = true
        profileImageView.heightAnchor.constraint(equalToConstant: 44).isActive = true
        profileImageView.widthAnchor.constraint(equalTo: profileImageView.heightAnchor, multiplier: 1).isActive = true
        
        descriptionTextView.translatesAutoresizingMaskIntoConstraints = false
//        descriptionLabel.leadingAnchor.constraint(equalTo: cellStackView.leadingAnchor, constant: 0).isActive = true
//        descriptionLabel.trailingAnchor.constraint(equalTo: cellStackView.trailingAnchor, constant: 0).isActive = true
        // descriptionTextView.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        feedImage.translatesAutoresizingMaskIntoConstraints = false
        feedImage.heightAnchor.constraint(equalToConstant: 200).isActive = true
        
        
        summaryLabel.translatesAutoresizingMaskIntoConstraints = false
        summaryLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        feedActionStackView.translatesAutoresizingMaskIntoConstraints = false
        feedActionStackView.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
    }




}
