
//
//  ImageView.swift
//  WHC_AutoLayoutExample
//
//  Created by WHC on 2018/8/26.
//  Copyright © 2018年 吴海超. All rights reserved.
//

import UIKit
@objc protocol WHC_GestureImageViewDelegate {
    @objc func WHCGestureImageViewExit();
}

class WHC_GestureImageView: UIImageView {
    /// 退出手势
    fileprivate var exitTapGesture: UITapGestureRecognizer!;
    /// 双击手势
    fileprivate var tapGesture: UITapGestureRecognizer!;
    /// 是否已经放大
    var isZoomBig = false;
    /// 协议
    var delegate: WHC_GestureImageViewDelegate!;
    override init(frame: CGRect) {
        super.init(frame: frame);
        self.layoutUI();
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder);
    }
    
    fileprivate func layoutUI() {
        self.isUserInteractionEnabled = true;
        self.exitTapGesture = UITapGestureRecognizer(target: self, action: #selector(handleExitGesture(_:)));
        self.addGestureRecognizer(exitTapGesture);
        self.tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTapGesture(_:)));
        self.tapGesture.numberOfTapsRequired = 2;
        self.addGestureRecognizer(tapGesture);
        self.exitTapGesture.require(toFail: tapGesture);
    }
    
    @objc func handleExitGesture(_ sender: UITapGestureRecognizer) {
        let scrollView = self.superview as! UIScrollView;
        scrollView.setZoomScale(1, animated: false);
        if let delegate = self.delegate {
            delegate.WHCGestureImageViewExit()
        }
    }
    
    @objc func handleTapGesture(_ sender: UITapGestureRecognizer) {
        let scrollView = self.superview as! UIScrollView;
        if self.isZoomBig {
            scrollView.setZoomScale(1, animated: true);
        }else {
            scrollView.setZoomScale(2.5, animated: true);
        }
        self.isZoomBig = !self.isZoomBig;
    }
}
