//
//  LCCircleLoopView.swift
//  LCCircleLoopView
//
//  Created by z on 16/5/31.
//  Copyright © 2016年 LC. All rights reserved.
//

import UIKit

class LCCircleLoopView: UIView, UIScrollViewDelegate {

    var containerScrollView: UIScrollView!
    var imgNames: [String]!
    var containerImgViews: [UIImageView]!
    
    //
    var currentImgView:     UIImageView!
    var nextImgView:        UIImageView!
    var previousImgView:    UIImageView!
    // index
    var currentIndex: NSInteger = 1
    var nextIndex: NSInteger = 2
    var previousIndex: NSInteger = 0
    
    //MARK: -
    //MARK: public func
    func setImgNames(imgNamesArray imgNamesArray: [String]) {
        imgNames = imgNamesArray
        if imgNames.count < 3 { //至少3张图片
            print("error: need three photos at least！")
            return
        }
        updateScrollView()
    }
    
    func updateScrollView()  {
        currentImgView.image = UIImage(named: imgNames[currentIndex])
        nextImgView.image = UIImage(named: imgNames[nextIndex])
        previousImgView.image = UIImage(named: imgNames[previousIndex])
        containerScrollView.setContentOffset(CGPointMake(bounds.size.width, 0), animated: false)
    }
    
    //MARK: -
    required override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupUI()
    }
    
    func  setupUI() {
        //use bounds not frame
        containerScrollView = UIScrollView()
        containerScrollView.frame = bounds
        containerScrollView.contentSize = CGSizeMake(bounds.size.width * 3, bounds.size.height)
        containerScrollView.pagingEnabled = true
        containerScrollView.autoresizingMask = [UIViewAutoresizing.FlexibleWidth, UIViewAutoresizing.FlexibleHeight]
        containerScrollView.delegate = self
        addSubview(containerScrollView)
        
        containerScrollView.setContentOffset(CGPointMake(bounds.size.width, 0), animated: false)
        
        currentImgView = UIImageView()
        currentImgView.frame = CGRectMake(bounds.size.width, 0, bounds.size.width, bounds.size.height)
        currentImgView.userInteractionEnabled = true
        currentImgView.contentMode = UIViewContentMode.ScaleAspectFill
        currentImgView.clipsToBounds = true
        containerScrollView.addSubview(currentImgView)
        
        nextImgView = UIImageView()
        nextImgView.frame = CGRectMake(bounds.size.width * 2, 0, bounds.size.width, bounds.size.height)
        nextImgView.userInteractionEnabled = true
        nextImgView.contentMode = UIViewContentMode.ScaleAspectFill
        nextImgView.clipsToBounds = true
        containerScrollView.addSubview(nextImgView)
        
        previousImgView = UIImageView()
        previousImgView.frame = CGRectMake(0, 0, bounds.size.width, bounds.size.height)
        previousImgView.userInteractionEnabled = true
        previousImgView.contentMode = UIViewContentMode.ScaleAspectFill
        previousImgView.clipsToBounds = true
        containerScrollView.addSubview(previousImgView)
    }
    
    func scrollViewWillBeginDragging(scrollView: UIScrollView) {
        
    }
    
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        let offset = scrollView.contentOffset.x
        if offset == 0 {
            previousIndex = getImgIndex(index: previousIndex, left: true)
            currentIndex = getImgIndex(index: currentIndex, left: true)
            nextIndex = getImgIndex(index: nextIndex, left: true)
        }else if offset == self.frame.size.width * 2 {
            previousIndex = getImgIndex(index: previousIndex, left: false)
            currentIndex = getImgIndex(index: currentIndex, left: false)
            nextIndex = getImgIndex(index: nextIndex, left: false)
        }
        // update UI
        updateScrollView()
    }
    
    func getImgIndex(index index: NSInteger, left: Bool) -> NSInteger {
        if left == true {
            let tmpIndex = index - 1
            if tmpIndex == -1 {
                return imgNames.count - 1
            } else {
                return tmpIndex
            }
        } else {
            let tmpIndex = index + 1
            if tmpIndex >= imgNames.count {
                return 0
            } else {
                return tmpIndex
            }
        }
    }
    
}
