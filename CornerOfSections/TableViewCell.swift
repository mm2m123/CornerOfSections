//
//  TableViewCell.swift
//  CornerOfSections
//
//  Created by 张毅成 on 2019/8/5.
//  Copyright © 2019 张毅成. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    enum Position {
        case solo
        case first
        case middle
        case last
    }
    var position: Position = .middle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        adjustMyFrame()
        setCorners()
    }
    
    func adjustMyFrame() {
        frame = CGRect(x: 16, y: frame.minY, width: superview!.frame.width - 32, height: frame.height)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setCorners() {
        let cornerRadius: CGFloat = 8.0
        switch position {
        case .solo: roundCorners(corners: .allCorners, radius: cornerRadius)
        case .first: roundCorners(corners: [.topLeft, .topRight], radius: cornerRadius)
        case .last: roundCorners(corners: [.bottomLeft, .bottomRight], radius: cornerRadius)
        default: noCornerMask()
        }
    }
}

extension UIView {
    func roundCorners(corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        layer.mask = mask
    }
    func noCornerMask() {
        layer.mask = nil
    }
}
