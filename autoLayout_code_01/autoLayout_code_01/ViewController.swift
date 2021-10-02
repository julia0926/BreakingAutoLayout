//
//  ViewController.swift
//  autoLayout_code_01
//
//  Created by 김지인 on 2021/10/02.
//

import UIKit

class ViewController: UIViewController {
    //클로저로 뷰를 설정
    let mySecondView : UIView = {
       let view = UIView()
        view.backgroundColor = UIColor.green
        view.layer.cornerRadius = 30
        view.translatesAutoresizingMaskIntoConstraints = false //코드로 autolayout 설정시
        view.clipsToBounds = true
        return view
    }()
    
    var myThirdView: MyCircleView{
        let circleView = MyCircleView()
        circleView.backgroundColor = .systemOrange
        circleView.translatesAutoresizingMaskIntoConstraints = false //코드로 autolayout 설정시
        return circleView
    }

    override func viewDidLoad() {
        // Do any additional setup after loading the view.
        super.viewDidLoad()
        
        let myFirstView = UIView()
        myFirstView.translatesAutoresizingMaskIntoConstraints = false //코드로 autolayout 설정시
        myFirstView.backgroundColor = .systemMint
        self.view.addSubview(myFirstView) //view 안에 작은 뷰 넣음
        
        //x,y축 위치 가로,세로
        myFirstView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true //가운데로 센터
        myFirstView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 200).isActive = true
        
        //뷰 크기
        myFirstView.widthAnchor.constraint(equalToConstant: 200).isActive = true //가로
        myFirstView.heightAnchor.constraint(equalToConstant: 200).isActive = true //세로 크기 줌
        
        myFirstView.layer.cornerRadius = 30
        
        self.view.addSubview(mySecondView)
        NSLayoutConstraint.activate([ //isActive = true 번거롭게 안해도 여기 배열에 넣으면 사용 가능
            mySecondView.widthAnchor.constraint(equalToConstant: 100),
            mySecondView.heightAnchor.constraint(equalToConstant: 100),
            mySecondView.leadingAnchor.constraint(equalTo: myFirstView.leadingAnchor, constant: 10), //왼쪽
            mySecondView.topAnchor.constraint(equalTo: myFirstView.bottomAnchor, constant: 20),
        ])
        
        //        mySecondView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        //        mySecondView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        //        mySecondView.leadingAnchor.constraint(equalTo: myFirstView.leadingAnchor, constant: 10).isActive = true //왼쪽
        //        mySecondView.topAnchor.constraint(equalTo: myFirstView.bottomAnchor, constant: 20).isActive = true
        
        
        self.view.addSubview(myThirdView)
        myThirdView.widthAnchor.constraint(equalToConstant: 150).isActive = true
        myThirdView.heightAnchor.constraint(equalToConstant: 150).isActive = true
//        myThirdView.heightAnchor.constraint(equalTo: mySecondView.heightAnchor, multiplier: 1.5).isActive = true//secondview의 1.5배로
        myThirdView.topAnchor.constraint(equalTo: mySecondView.bottomAnchor, constant: 50).isActive = true
        myThirdView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true

        
    }


}

#if DEBUG
import SwiftUI

struct ViewControllerRepresentable: UIViewControllerRepresentable {
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
        
    }
    @available(iOS 13.0, *)
    func makeUIViewController(context: Context) -> UIViewController {
        ViewController()
    }
}

struct ViewController_Previews: PreviewProvider {
    static var previews: some View {
        ViewControllerRepresentable().previewDisplayName("아이폰 12")
    }
}

#endif


