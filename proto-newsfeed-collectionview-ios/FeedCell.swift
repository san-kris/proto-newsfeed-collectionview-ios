//
//  FeedCell.swift
//  proto-newsfeed-collectionview-ios
//
//  Created by Santosh Krishnamurthy on 3/28/23.
//

import UIKit

class FeedCell: UICollectionViewCell {
    
    private let profileImageView: UIImageView =  {
        let iv = UIImageView(image: UIImage(systemName: "person.circle"))
        iv.contentMode = UIView.ContentMode.scaleAspectFit
        iv.backgroundColor = .red
        return iv
    }()
    
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
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "This is a description of the profile"
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .black
        label.backgroundColor = .yellow
        return label
    }()
    
    private let feedImage: UIImageView = {
        let iv = UIImageView(image: UIImage(named: "Background-Euro"))
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        return iv
    }()
    
    lazy private var cellStackView: UIStackView = {
        
        let grayView = UIView()
        grayView.backgroundColor = .gray
        let sv = UIStackView(arrangedSubviews: [profileStackView, descriptionLabel, feedImage])
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
        
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
//        descriptionLabel.leadingAnchor.constraint(equalTo: cellStackView.leadingAnchor, constant: 0).isActive = true
//        descriptionLabel.trailingAnchor.constraint(equalTo: cellStackView.trailingAnchor, constant: 0).isActive = true
        descriptionLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        
    }




}
