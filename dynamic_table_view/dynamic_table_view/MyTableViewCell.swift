//
//  MyTableViewCell.swift
//  dynamic_table_view
//
//  Created by 김지인 on 2021/09/15.
//

import Foundation
import UIKit

class MyTableViewCell: UITableViewCell{
    
    @IBOutlet weak var userProfileImg: UIImageView!
    
    @IBOutlet weak var userContentLabel: UILabel!
    
    
    //쎌이 렌더링 될 때 = 뷰를 그릴 때
    override func awakeFromNib() {
        super.awakeFromNib()
        
        print("called!")
        
        //동그랗게 만들기
        userProfileImg.layer.cornerRadius = userProfileImg.frame.height / 2
    }
}
