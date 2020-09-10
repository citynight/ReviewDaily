//
//  ViewController.swift
//  Event
//
//  Created by 李小争 on 2020/9/9.
//  Copyright © 2020 李小争. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    private let cornerButton = CustomButton()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        cornerButton.frame = CGRect(x: 100, y: 100, width: 200, height: 200)
        cornerButton.backgroundColor = .red
        cornerButton.addTarget(self, action: #selector(doAction(sender:)), for: .touchUpInside)
        view.addSubview(cornerButton)
    }


}

@objc private
extension ViewController {
    func doAction(sender: UIButton) {
        print(#function)
    }
}
