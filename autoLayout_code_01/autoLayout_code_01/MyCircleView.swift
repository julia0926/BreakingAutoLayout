//
//  MyCircleView.swift
//  autoLayout_code_01
//
//  Created by 김지인 on 2021/10/03.
//

import Foundation
import UIKit

class MyCircleView: UIView{
    override func layoutSubviews() {
        super.layoutSubviews()
        print("MyCircleView - layoutSubviews called")
        self.layer.cornerRadius = self.frame.height / 2
    }
}
