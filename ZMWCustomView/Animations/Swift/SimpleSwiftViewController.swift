//
//  SimpleSwiftViewController.swift
//  ZMWCustomView
//
//  Created by xiaoming on 16/10/18.
//  Copyright © 2016年 shandandan. All rights reserved.
//

import UIKit

class SimpleSwiftViewController: UIViewController {

    var positionView    :   UIView!
    var positionView1   :   UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        self.initAllView()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.animationAction()
    }
    
    // 初始化view
    func initAllView() {
        positionView = UIView.init(frame: CGRect.init(x: 10, y: 10, width: 50, height: 50))
        positionView.backgroundColor = UIColor.red
        self.view.addSubview(positionView)
        
        positionView1 = UIView.init(frame: CGRect.init(x: 10, y: 80, width: 50, height: 50))
        positionView1.backgroundColor = UIColor.blue
        self.view.addSubview(positionView1)
    }

    // 动画方法
    func animationAction() {
        UIView.animate(withDuration: 0.3) {
            self.positionView.frame = CGRect.init(x: UIScreen.main.bounds.width - 60 - 10, y: 10, width: 50, height: 50)
        }
        UIView.animate(withDuration: 0.3, delay: 0.3, options: .allowAnimatedContent, animations: {
            self.positionView1.frame = CGRect.init(x: UIScreen.main.bounds.width - 60 - 10, y: 80, width: 50, height: 50)

            }, completion: nil)
        
    }
}
