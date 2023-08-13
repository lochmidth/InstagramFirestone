//
//  CommentCell.swift
//  InstagramFirestone
//
//  Created by Alphan Ogün on 11.08.2023.
//

import UIKit

class CommentCell: UICollectionViewCell {
    
    //MARK: - Properties
    
    var viewModel: CommentViewModel? {
        didSet { configure() }
    }
    
    private let profileImageUrl: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.backgroundColor = .lightGray
        return iv
    }()
    
    private let commentLabel = UILabel()
    
    //MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(profileImageUrl)
        profileImageUrl.centerY(inView: self, leftAnchor: leftAnchor, paddingLeft: 8)
        profileImageUrl.setDimensions(height: 40, width: 40)
        profileImageUrl.layer.cornerRadius = 40/2
        
        commentLabel.numberOfLines = 0
        addSubview(commentLabel)
        commentLabel.centerY(inView: profileImageUrl, leftAnchor: profileImageUrl.rightAnchor, paddingLeft: 8)
        commentLabel.anchor(right: rightAnchor, paddingRight: 8)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Helpers
    
    func configure() {
        guard let viewModel = viewModel else { return }
        
        profileImageUrl.sd_setImage(with: viewModel.profileImageUrl)
        commentLabel.attributedText = viewModel.commentLabelText()
    }
}
