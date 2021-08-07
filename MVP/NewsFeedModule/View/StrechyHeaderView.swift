//
//  StrechyHeaderView.swift
//  MVP
//
//  Created by Romanovich Bogdan on 05.08.2021.
//

import UIKit

    class StrechyTableHeaderView: UIView {
        
        var presentor: NewsFeedTableViewCellPresentorProtocol!
        
        private let imageView: UIImageView = {
            let imageView = UIImageView()
            imageView.clipsToBounds = true
            imageView.contentMode = .scaleAspectFill
            return imageView
        }()
        
        private let titleLabel = UILabel(font: .AvenirNext(.regular, size: 20),
                                         color: .white,
                                         lines: 4,
                                         sizeToFit: true, shadow: true)
        
        private let dateLabel = UILabel(font: .AvenirNext(.demiBold, size: 16),
                                        aligment: .center,
                                        color: .white, shadow: true)
        
        
        private var imageViewHeight = NSLayoutConstraint()
        private var imageViewBottom = NSLayoutConstraint()
        private var containerView = UIView()
        private var containerViewHeight = NSLayoutConstraint()
        
        override init(frame: CGRect) {
            super.init(frame: frame)
            createViews()
            setViewsConstraints()
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        private func createViews() {
            
            addSubview(containerView)
            
            containerView.addSubview(imageView)
            containerView.addSubview(dateLabel)
            containerView.addSubview(titleLabel)
        }
        
        private func setViewsConstraints() {
            NSLayoutConstraint.activate([
                widthAnchor.constraint(equalTo: containerView.widthAnchor),
                centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
                heightAnchor.constraint(equalTo: containerView.heightAnchor)
            ])
            
            containerView.translatesAutoresizingMaskIntoConstraints = false
            
            containerView.widthAnchor.constraint(equalTo: imageView.widthAnchor).isActive = true
            containerViewHeight = containerView.heightAnchor.constraint(equalTo: self.heightAnchor)
            containerViewHeight.isActive = true
            
            imageView.translatesAutoresizingMaskIntoConstraints = false
            imageViewBottom = imageView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor)
            imageViewBottom.isActive = true
            imageViewHeight = imageView.heightAnchor.constraint(equalTo: containerView.heightAnchor)
            imageViewHeight.isActive = true
            
            NSLayoutConstraint.activate([
                dateLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -8),
                dateLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 8),
                dateLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -8)
            ])
            NSLayoutConstraint.activate([
                titleLabel.bottomAnchor.constraint(equalTo: dateLabel.topAnchor, constant: -10),
                titleLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 8),
                titleLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -8),
                
            ])
        }
        
        public func scrollViewDidScroll(scrollView: UIScrollView) {
            containerViewHeight.constant = scrollView.contentInset.top
            let offsetY = -(scrollView.contentOffset.y + scrollView.contentInset.top)
            containerView.clipsToBounds = offsetY <= 0
            imageViewBottom.constant = offsetY >= 0 ? 0 : -offsetY / 2
            imageViewHeight.constant = max(offsetY + scrollView.contentInset.top,
                                           scrollView.contentInset.top)
        }
        
    }


//MARK: - NewsFeedTableViewCellProtocol

extension StrechyTableHeaderView: NewsFeedTableViewCellProtocol {
    func setImage(with imageData: Data) {
        imageView.image = UIImage(data: imageData)
    }
    
    func setTitle(with title: String) {
        titleLabel.text = title
    }
    
    func setDate(with date: String) {
        dateLabel.text = date
    }
}
