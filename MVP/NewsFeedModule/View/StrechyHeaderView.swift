//
//  StrechyHeaderView.swift
//  MVP
//
//  Created by Romanovich Bogdan on 05.08.2021.
//

import UIKit

    final class StrechyTableHeaderView: UIView {
        
        public let imageView: UIImageView = {
            let imageView = UIImageView()
            imageView.clipsToBounds = true
            imageView.contentMode = .scaleAspectFill
            return imageView
        }()
        
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
            imageViewHeight = imageView.topAnchor.constraint(equalTo: containerView.topAnchor)
            imageViewHeight.isActive = true
        }
        
        public func scrollViewDidScroll(scrollView: UIScrollView) {
            containerViewHeight.constant = scrollView.contentInset.top
            let offsetY = -(scrollView.contentOffset.y + scrollView.contentInset.top)
            containerView.clipsToBounds = offsetY <= 0
            imageViewBottom.constant = offsetY >= 0 ? 0 : -offsetY / 2
            imageViewBottom.constant = max(offsetY + scrollView.contentInset.top,
                                           scrollView.contentInset.top)
        }
        
    }

