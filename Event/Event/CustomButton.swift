//
//  CustomButton.swift
//  Event
//
//  Created by 李小争 on 2020/9/9.
//  Copyright © 2020 李小争. All rights reserved.
//

import UIKit
import Foundation

class CustomButton: UIButton {

    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        // boundary 不能接收事件情况判断(不可交互,隐藏,透明度小于0.01)
        if !isUserInteractionEnabled || isHidden || alpha <= 0.01 {
            return nil
        }
        
        if self.point(inside: point, with: event) {
            // 倒序遍历当前对象的子视图
            var hit:UIView? = nil
            for view in subviews.reversed() {
                let convertPoint = convert(point, to: view)
                hit = view.hitTest(convertPoint, with: event)
                if hit != nil{
                    break
                }
            }
            
            // 判断是否找到子视图响应事件,
            if let hit = hit {
                return hit
            }
            return self
        }
        return nil
    }

    override func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
        let x1 = point.x
        let y1 = point.y
        
        let x2 = frame.size.width / 2
        let y2 = frame.size.height / 2
        
        let dis = sqrt((x1 - x2) * (x1 - x2) + (y1 - y2) * (y1 - y2))
        
        // 在以当前控件中心为圆心 半径为当前控件宽度的圆内
        return dis <= frame.size.width / 2
    }
}
