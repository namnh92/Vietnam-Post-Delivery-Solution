//
//  DashLineView.swift
//  vn-pickup
//
//  Created by Nguyễn Nam on 6/15/19.
//  Copyright © 2019 Nguyễn Nam. All rights reserved.
//

import UIKit

class DashLineView: UIView {
    
    // MARK: - Inspectable
    @IBInspectable var perDashLength: CGFloat = 2.0
    @IBInspectable var spaceBetweenDash: CGFloat = 2.0
    @IBInspectable var dashColor: UIColor = UIColor.lightGray
    
    // MARK: - Setup
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    // MARK: - Drawing
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        let  path = UIBezierPath()
        if height > width {
            let  p0 = CGPoint(x: self.bounds.midX, y: self.bounds.minY)
            path.move(to: p0)
            
            let  p1 = CGPoint(x: self.bounds.midX, y: self.bounds.maxY)
            path.addLine(to: p1)
            path.lineWidth = width
            
        } else {
            let  p0 = CGPoint(x: self.bounds.minX, y: self.bounds.midY)
            path.move(to: p0)
            
            let  p1 = CGPoint(x: self.bounds.maxX, y: self.bounds.midY)
            path.addLine(to: p1)
            path.lineWidth = height
        }
        
        let  dashes: [ CGFloat ] = [ perDashLength, spaceBetweenDash ]
        path.setLineDash(dashes, count: dashes.count, phase: 0.0)
        
        path.lineCapStyle = .butt
        dashColor.set()
        path.stroke()
    }
    
    private var width : CGFloat {
        return self.bounds.width
    }
    
    private var height : CGFloat {
        return self.bounds.height
    }
}
