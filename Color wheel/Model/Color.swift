//
//  Color.swift
//  Color wheel
//
//  Created by Stephanie Bowles on 6/7/19.
//  Copyright © 2019 Stephanie Bowles. All rights reserved.
//

import UIKit


struct Color {


    static func getHueSaturation(at offset: CGPoint) -> (hue: CGFloat, saturation: CGFloat){
        if offset == CGPoint.zero {
        return (hue: 0, saturation: 0)
        } else {
            let saturation = sqrt(offset.x * offset.x + offset.y * offset.y)
            var hue = acos(offset.x / saturation) / (2.0 * CGFloat.pi)
            if offset.y < 0 {hue = 1.0 - hue}
            return (hue: hue, saturation: saturation)
        }
    }
}
