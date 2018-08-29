//
//  WHC_ImageDisplayView.swift
//  CRM
//
//  Created by 吴海超 on 15/10/26.
//  Copyright © 2015年 吴海超. All rights reserved.
//

/*********************************************************
 *  gitHub:https://github.com/netyouli/WHC_AutoLayoutKit *
 *  本人其他优秀开源库：https://github.com/netyouli          *
 *********************************************************/


import UIKit

class WHC_ImageDisplayView: UIView , UIScrollViewDelegate , WHC_GestureImageViewDelegate{

    fileprivate var images: [AnyObject]!;
    fileprivate var scrollView: UIScrollView!;
    fileprivate var index = 0;
    fileprivate var kZoomAniamtionTime = 0.3;
    fileprivate var currentIndex = 0;
    fileprivate var column = 0;
    fileprivate var currentImageView: WHC_GestureImageView!;
    fileprivate let kImageViewTag = 10;
    fileprivate var backView: UIView!;
    fileprivate var rect: CGRect!;
    fileprivate var kShowLabelHeight:CGFloat = 20;
    fileprivate var showLabel: UILabel!;
    class func show(_ images: [AnyObject] ,
                    index: Int ,
                    item: UIView ,
                    column: Int) -> WHC_ImageDisplayView {
        return WHC_ImageDisplayView(frame: UIScreen.main.bounds,
            images: images ,
            index: index,
            rect: item.convert(item.bounds, to: (UIApplication.shared.delegate?.window)!),
            column: column);
    }
    
    init(frame: CGRect ,
        images: [AnyObject] ,
         index: Int ,
         rect: CGRect ,
        column: Int) {
        super.init(frame: frame);
        self.images = images;
        self.index = index;
        self.currentIndex = index;
        self.column = column;
        self.rect = rect;
        self.layoutUI();
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder);
    }
    
    
    fileprivate func layoutUI() {
        self.backView = UIView(frame: UIScreen.main.bounds);
        self.backView.backgroundColor = UIColor.black;
        self.backView.alpha = 0;
        UIApplication.shared.delegate?.window??.addSubview(self.backView);
        
        self.backgroundColor = UIColor.clear;
        self.scrollView = UIScrollView(frame: self.bounds);
        self.scrollView.delegate = self;
        self.scrollView.showsHorizontalScrollIndicator = false;
        self.scrollView.showsVerticalScrollIndicator = false;
        self.addSubview(self.scrollView);
        if self.images.count > 0 {
            for (i , image) in self.images.enumerated() {
                let imageScrollView = UIScrollView(frame: CGRect(x: CGFloat(i) * self.width(), y: 0, width: self.width(), height: self.height()));
                let imageView = WHC_GestureImageView(frame: imageScrollView.bounds);
                imageView.delegate = self;
                if self.currentIndex == i {
                    self.currentImageView = imageView;
                }
                imageView.tag = kImageViewTag;
                imageScrollView.addSubview(imageView);
                imageScrollView.delegate = self;
                imageScrollView.isMultipleTouchEnabled = true;
                imageScrollView.minimumZoomScale = 1.0;
                imageScrollView.maximumZoomScale = 2.5;
                imageScrollView.backgroundColor = UIColor.clear;
                imageScrollView.tag = i;
                self.scrollView.addSubview(imageScrollView);
                var imageObject: UIImage!;
                if image is UIImage {
                    imageObject = image as! UIImage;
                }else if image is String {
                    let imageName: String = image  as! String;
                    imageObject = UIImage(named: imageName);
                }
                if imageObject.size.width < imageScrollView.width() {
                    imageView.setWidth(imageObject.size.width);
                }
                if imageObject.size.height < imageScrollView.height() {
                    imageView.setHeight(imageObject.size.height);
                }
                imageView.setXy(CGPoint(x: (imageScrollView.width() - imageView.width()) / 2.0, y: (imageScrollView.height() - imageView.height()) / 2.0));
                imageView.image = imageObject;
            }
            self.scrollView.isPagingEnabled = true;
            self.scrollView.contentSize = CGSize(width: CGFloat(self.images.count) * self.scrollView.width(), height: self.scrollView.height());
            self.scrollView.setContentOffset(CGPoint(x: CGFloat(self.index) * self.width(), y: 0), animated: false);
            
            self.showLabel = UILabel(frame: CGRect(x: 0, y: self.height() - kShowLabelHeight, width: self.width(), height: kShowLabelHeight));
            self.showLabel.text = "\(self.images.count) / \(self.index + 1)";
            self.showLabel.textColor = UIColor.white;
            self.showLabel.textAlignment = .center;
            self.addSubview(self.showLabel);
            UIApplication.shared.delegate?.window??.addSubview(self);
            
            var rc = CGRect(x: 0, y: 0, width: self.currentImageView.width(), height: self.currentImageView.height());
            rc.origin = CGPoint(x: (self.width() - currentImageView.width()) / 2.0, y: (self.height() - currentImageView.height()) / 2.0);
            self.currentImageView.frame = self.rect;
            UIView.animate(withDuration: kZoomAniamtionTime, delay: 0, options: .curveEaseIn, animations: { () -> Void in
                self.currentImageView.frame = rc;
                self.backView.alpha = 1.0;
                }, completion: nil);
        }
    }
    
    fileprivate func getExitRect() -> CGRect {
        var rc = CGRect(x: 0, y: 0, width: self.rect.width, height: self.rect.height);
        var startRect = CGRect(x: 0, y: 0, width: self.rect.width, height: self.rect.height);
        if self.index < self.column {
            startRect.origin.x = self.rect.minX - CGFloat(self.index) * self.rect.width;
            startRect.origin.y = self.rect.minY;
        }else {
            let row = ((self.index + 1) / self.column + ((self.index + 1) % self.column != 0 ? 1 : 0) - 1);
            let col = ((self.index + 1) % self.column == 0 ? self.column : (self.index + 1) % self.column) - 1;
            startRect.origin.x = self.rect.minX - CGFloat(col) * self.rect.width;
            startRect.origin.y = self.rect.minY - CGFloat(row) * self.rect.height;
        }
        if self.currentIndex < self.column {
            rc.origin.x = startRect.minX + CGFloat(self.currentIndex) * self.rect.width;
            rc.origin.y = startRect.minY;
        }else {
            let row = ((self.currentIndex + 1) / self.column + ((self.currentIndex + 1) % self.column != 0 ? 1 : 0) - 1);
            let col = ((self.currentIndex + 1) % self.column == 0 ? self.column : (self.currentIndex + 1) % self.column) - 1;
            rc.origin.x = startRect.minX + CGFloat(col) * self.rect.width;
            rc.origin.y = startRect.minY + CGFloat(row) * self.rect.height;
        }
        return rc;
    }
    
    //MARK: - WHC_GestureImageViewDelegate
    func WHCGestureImageViewExit() {
        let subView = self.scrollView.viewWithTag(self.currentIndex)!;
        self.currentImageView = subView.viewWithTag(kImageViewTag) as! WHC_GestureImageView;
        let rc = self.getExitRect();
        UIView.animate(withDuration: kZoomAniamtionTime, delay: 0, options: UIViewAnimationOptions.curveEaseOut, animations: { () -> Void in
            self.backView.alpha = 0;
            self.currentImageView.frame = rc;
            }) { (finish) -> Void in
                self.backView.removeFromSuperview();
                self.removeFromSuperview();
        }
    }
    
    //MARK: - UIScrollViewDelegate
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        if self.scrollView === scrollView {
            self.currentIndex = Int(floor((scrollView.contentOffset.x - scrollView.width() / 2.0) / scrollView.width())) + 1;
            if self.currentIndex < 0 {
                self.currentIndex = 0;
            }else if self.currentIndex > self.images.count {
                self.currentIndex = self.images.count - 1;
            }
            self.showLabel.text = "\(self.images.count) / \(self.currentIndex + 1)";
        }
    }
    
    func scrollViewDidZoom(_ scrollView: UIScrollView) {
        if scrollView !== self.scrollView {
            let offsetX = (scrollView.width() > scrollView.contentSize.width) ?
            (scrollView.width() - scrollView.contentSize.width) / 2.0 : 0.0;
            let offsetY = (scrollView.height() > scrollView.contentSize.height) ?
            (scrollView.height() - scrollView.contentSize.height) / 2.0 : 0.0;
            self.currentImageView.center = CGPoint(x: scrollView.contentSize.width / 2.0 + offsetX,
            y: scrollView.contentSize.height / 2.0 + offsetY);
        }
    }
    
    func scrollViewDidEndZooming(_ scrollView: UIScrollView, with view: UIView?, atScale scale: CGFloat) {
        if scale <= 1 {
            self.currentImageView.isZoomBig = false;
        }else {
            self.currentImageView.isZoomBig = true;
        }
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        if scrollView !== self.scrollView {
            let subView = self.scrollView.viewWithTag(self.currentIndex)!;
            self.currentImageView = subView.viewWithTag(kImageViewTag) as! WHC_GestureImageView;
            return self.currentImageView;
        }
        return nil;
    }
}
