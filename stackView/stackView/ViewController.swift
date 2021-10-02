//
//  ViewController.swift
//  stackView
//
//  Created by 김지인 on 2021/09/20.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var phoneNumberLabel: UILabel!
    @IBOutlet var phoneNumberBtns: [CircleButton]!
    @IBOutlet weak var phoneCallBtn: CircleButton!
    
    var phoneNumberString = ""{ // 값이 설정되면
        didSet{
            DispatchQueue.main.async { [weak self] in //메모리 강하게 잡지 않을 것이다.
                guard let self = self else{ return } //갖고있는 self가 값이 없다면 return
                self.phoneNumberLabel.textColor = .black
                self.phoneNumberLabel.text = self.phoneNumberString //라벨의 텍스트를 바로 변경
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        for btnItem in phoneNumberBtns {
            btnItem.addTarget(self, action: #selector(onNumberBtnClicked(sender: )), for: .touchUpInside) // 버튼이 클릭 됐을 때
        }
        
        phoneCallBtn.addTarget(self, action: #selector(onPhoneCallBtnClicked(_:)), for: .touchUpInside)
    }
    
    @objc fileprivate func onNumberBtnClicked(sender: UIButton){
        guard let inputString = sender.titleLabel?.text else { return }
        phoneNumberString.append(inputString)
    }

    @objc fileprivate func onPhoneCallBtnClicked(_ sender: UIButton){
        phoneNumberString.removeAll()
    }

}

