//
//  ViewController.swift
//  LCCircleLoopView
//
//  Created by z on 16/5/31.
//  Copyright © 2016年 LC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let circleView = LCCircleLoopView(frame: CGRectMake(0, 100, view.frame.size.width, 200) )
        
        circleView.setImgNames(imgNamesArray: [ "shu.jpg", "Narutos.jpg", "bear.jpg"])
        view.addSubview(circleView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

