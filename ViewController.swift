//
//  ViewController.swift
//  LCCircleLoopView
//
//  Created by z on 16/5/31.
//  Copyright © 2016年 LC. All rights reserved.
//

import UIKit

class ViewController: UIViewController, LCCircleLoopViewDelegate {

    @IBOutlet weak var circleView: LCCircleLoopView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let circleView = LCCircleLoopView(frame: CGRectMake(0, 100, view.frame.size.width, 200) )
        circleView.delegate = self
        circleView.setImgNames(imgNamesArray: ["lunbo1", "lunbo2", "lunbo3", "lunbo4"])
        view.addSubview(circleView)
//        let delayTime = dispatch_time(DISPATCH_TIME_NOW, Int64(1 * Double(NSEC_PER_SEC)))
//        
//        dispatch_after(delayTime, dispatch_get_main_queue()) {
//            self.circleView.setImgNames(imgNamesArray: ["lunbo1", "lunbo2", "lunbo3", "lunbo4"])
//            print("view did load: \(UIScreen.mainScreen().bounds.width)")
//        }
        
        
        
    }

    func clickedImageAction(currentIndex: NSInteger) {
        print(currentIndex)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

