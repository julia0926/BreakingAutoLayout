//
//  CircleButton.swift
//  stackView
//
//  Created by 김지인 on 2021/09/30.
//

import Foundation
import UIKit


@IBDesignable
class CircleButton: UIButton{
    
    //인스펙터 패널에서 사용될 수 있또록 설정
    @IBInspectable var cornerRadius: CGFloat = 0{
        didSet{
            layer.cornerRadius = cornerRadius
            layer.masksToBounds = cornerRadius > 0
        }
    }
    
}
