//
//  UIView+ConstraintLayout.swift
//  Final
//
//  Created by 고상원 on 2019-06-13.
//  Copyright © 2019 고상원. All rights reserved.
//

import UIKit

struct AnchoredConstraints {
    var top, leading, bottom, trailing, width, height: NSLayoutConstraint?
}

extension UIView {
    
    func matchParent(padding: UIEdgeInsets = .zero) {
        translatesAutoresizingMaskIntoConstraints = false
        if let superTopAnchor = superview?.topAnchor {
            self.topAnchor.constraint(equalTo: superTopAnchor, constant: padding.top).isActive = true
        }
        if let superBottomAnchor = superview?.bottomAnchor {
            self.bottomAnchor.constraint(equalTo: superBottomAnchor, constant: -padding.bottom).isActive = true
        }
        if let superLeadingAnchor = superview?.leadingAnchor {
            self.leadingAnchor.constraint(equalTo: superLeadingAnchor, constant: padding.left).isActive = true
        }
        if let superTrailingAnchor = superview?.trailingAnchor {
            self.trailingAnchor.constraint(equalTo: superTrailingAnchor, constant: -padding.right).isActive = true
        }
    }
    
    @discardableResult
    func anchors(topAnchor: NSLayoutYAxisAnchor?, leadingAnchor: NSLayoutXAxisAnchor?, trailingAnchor: NSLayoutXAxisAnchor?, bottomAnchor: NSLayoutYAxisAnchor?, padding: UIEdgeInsets = .zero, size: CGSize = .zero) -> AnchoredConstraints {
        
        translatesAutoresizingMaskIntoConstraints = false
        
        var anchoredConstraints = AnchoredConstraints()
        if let topAnchor = topAnchor {
            anchoredConstraints.top = self.topAnchor.constraint(equalTo: topAnchor, constant: padding.top)
        }
        if let bottomAnchor = bottomAnchor {
            anchoredConstraints.bottom = self.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -padding.bottom)
        }
        if let leadingAnchor = leadingAnchor {
            anchoredConstraints.leading = self.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding.left)
        }
        if let trailingAnchor = trailingAnchor {
            anchoredConstraints.trailing = self.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -padding.right)
        }
        if size.width != 0 {
            anchoredConstraints.width = self.widthAnchor.constraint(equalToConstant: size.width)
        }
        if size.height != 0 {
            anchoredConstraints.height = self.heightAnchor.constraint(equalToConstant: size.height)
        }
        
        [anchoredConstraints.top, anchoredConstraints.bottom, anchoredConstraints.leading, anchoredConstraints.trailing, anchoredConstraints.width, anchoredConstraints.height].forEach { $0?.isActive = true }
        
        return anchoredConstraints
    }
    
    func constraintWidth(equalToConstant: CGFloat) {
        translatesAutoresizingMaskIntoConstraints = false
        self.widthAnchor.constraint(equalToConstant: equalToConstant).isActive = true
    }
    
    func constraintHeight(equalToConstant: CGFloat) {
        translatesAutoresizingMaskIntoConstraints = false
        self.heightAnchor.constraint(equalToConstant: equalToConstant).isActive = true
    }
}

