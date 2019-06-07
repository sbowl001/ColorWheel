//
//  ColorWheel.swift
//  Color wheel
//
//  Created by Stephanie Bowles on 6/7/19.
//  Copyright © 2019 Stephanie Bowles. All rights reserved.
//

import UIKit

class ColorWheel: UIControl {
    
    //MARK: Properties
    
    var color: UIColor = .white
    
    override func layoutSubviews() {
        super.layoutSubviews()
        clipsToBounds = true
        let radius = frame.width / 2.0
        layer.cornerRadius = radius
        layer.borderWidth = 1.0
        layer.borderColor = UIColor.black.cgColor
    }
    
    
    override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        let touchPoint = touch.location(in: self)
        
//        let center = CGPoint(x: bounds.midX, y: bounds.midY)
//        let dy = touchPoint.y - center.y
//        let dx = touchPoint.x - center.x
//        let offset = CGPoint( x: dx / center.x , y: dy / center.y)
//        let (hue, saturation) = Color.getHueSaturation(at: offset)
//        color = UIColor(hue: hue, saturation: saturation, brightness: 0.8, alpha: 1.0)
        color = self.color(for: touchPoint)
        
        sendActions(for: [.touchDown, .valueChanged])
        return true
    }
    
   
    override func continueTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        let touchPoint = touch.location(in: self)
        if bounds.contains(touchPoint) {
            color = self.color(for: touchPoint)
            sendActions(for: [.touchDragInside, .valueChanged])
        } else {
            sendActions(for: [.touchDragOutside])
        }
        return true
    }
    override func endTracking(_ touch: UITouch?, with event: UIEvent?) {
        defer {super.endTracking(touch, with: event)}
       
        guard let touch = touch else {return}
        
        let touchPoint = touch.location(in: self)
        if bounds.contains(touchPoint) {
            color = self.color(for: touchPoint)
            sendActions(for: [.touchUpInside, .valueChanged])
        } else {
            sendActions(for: [.touchUpOutside])
        }
    }
    
    override func cancelTracking(with event: UIEvent?) {
        sendActions(for: [.touchCancel])
    }
    
    override func draw(_ rect: CGRect) {
        for y in stride(from: 0, to: bounds.maxY, by: 1 ) {
            for x in stride(from: 0, to: bounds.maxX, by: 1) {
//                let center = CGPoint(x: bounds.midX, y: bounds.midY)
//                let dy = y - center.y
//                let dx = x - center.x
//                let offset = CGPoint( x: dx / center.x , y: dy / center.y)
//                let (hue, saturation) = Color.getHueSaturation(at: offset)
//                let color = UIColor(hue: hue, saturation: saturation, brightness: 0.8, alpha: 1.0)
//
                let color = self.color(for: CGPoint(x: x, y: y))
                let pixel = CGRect(x: x, y: y, width: 1, height: 1)
                color.set()
                UIRectFill(pixel)
            }
        }
        
    }
    
    //MARK: Private
    private func color(for location: CGPoint) -> UIColor {
        let center = CGPoint(x: bounds.midX, y: bounds.midY)
        let dy = location.y - center.y
        let dx = location.x - center.x
        let offset = CGPoint( x: dx / center.x , y: dy / center.y)
        let (hue, saturation) = Color.getHueSaturation(at: offset)
        return UIColor(hue: hue, saturation: saturation, brightness: 0.8, alpha: 1.0)
    }
    
}
