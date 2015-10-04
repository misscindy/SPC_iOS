//
//  EventTableCardCell.swift
//  SPCV1
//
//  Created by Cindy Fan on 9/11/15.
//  Copyright (c) 2015 Cindy Fan. All rights reserved.
//

import UIKit

class SliderTableCell: UITableViewCell, UIScrollViewDelegate {
    

    @IBOutlet weak var pageControl: UIPageControl!
    var scrollView : UIScrollView
    let SCROLL_VIEW_HEIGHT = CGFloat(220.0)
    
    // Default to images if not set in
    var sliderImages:[UIImage] = [UIImage(named: "product")!, UIImage(named: "product2")!]
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        scrollView = UIScrollView()
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(scrollView)
        var view = UIView(frame: CGRectMake(0, 0, UIScreen.mainScreen().bounds.width, SCROLL_VIEW_HEIGHT))
        view.backgroundColor = UIColor.blackColor()
        scrollView.addSubview(view)
        
        println("contructor contentview size \(contentView.frame)")
    }

    required init(coder aDecoder: NSCoder) {
        scrollView = UIScrollView()
        super.init(coder: aDecoder)
        scrollView.frame = CGRectMake(0, 0, UIScreen.mainScreen().bounds.width, SCROLL_VIEW_HEIGHT)
        contentView.frame = scrollView.frame
        contentView.addSubview(scrollView)
        scrollView.delegate = self
        println("contructor contentview size(Decoder) \(contentView.frame)")


    }
    
    override func layoutSubviews() {
        contentView.backgroundColor = UIColor.clearColor()
    }
    
    override func awakeFromNib() {
        setupScroller()
    }
    
    func setupScroller() {
        scrollView.contentInset = UIEdgeInsetsMake(0, 0, 0, 0)
        pageControl.layer.zPosition = 1000
        pageControl.numberOfPages = sliderImages.count
        scrollView.delegate = self
        scrollView.pagingEnabled = true
        scrollView.scrollEnabled = true
        var scrollViewSize = scrollView.frame.size
        
        pageControl.addTarget(self, action: Selector("changePage:"), forControlEvents: UIControlEvents.ValueChanged)
        
        var count = 0
        for sliderImage in sliderImages {
            var imageFrame = CGRectMake(0, 0, UIScreen.mainScreen().bounds.width, SCROLL_VIEW_HEIGHT)
            imageFrame.origin.x = UIScreen.mainScreen().bounds.width * CGFloat(count)
            imageFrame.origin.y = 0.0
            print("orgin-x: \(imageFrame.origin.x)")
            print("orgin-y: \(imageFrame.origin.y)")
            
            var currentImageView = UIImageView(image:sliderImage)
            currentImageView.frame = imageFrame
            currentImageView.contentMode = UIViewContentMode.ScaleToFill
            
            scrollView.addSubview(currentImageView)
            count++
        }
    }
    
    func setSliderImages(sliderImages: [UIImage?]) {
        // populate subviews 
        scrollView.subviews.map { $0.removeFromSuperview() }
        pageControl.numberOfPages = sliderImages.count
        scrollView.contentSize = CGSize(width: UIScreen.mainScreen().bounds.width * CGFloat(pageControl.numberOfPages), height: SCROLL_VIEW_HEIGHT)
        
        var count = 0
        for sliderImage in sliderImages {
            var imageFrame = CGRectMake(0, 0, UIScreen.mainScreen().bounds.width, scrollView.bounds.height)
            imageFrame.origin.x = UIScreen.mainScreen().bounds.width * CGFloat(count)
            imageFrame.origin.y = 0.0
            
            var currentImageView = UIImageView(image:sliderImage)
            currentImageView.frame = imageFrame
            currentImageView.contentMode = UIViewContentMode.ScaleToFill
            
            scrollView.addSubview(currentImageView)
            count++
        }
    }
    
    func changePage(sender: AnyObject) -> () {
        var page = pageControl.currentPage
        print("changePage")
        scrollView.setContentOffset(CGPointMake(scrollView.frame.size.width * CGFloat(page), 0), animated: true)
    }
    
    // MARK: ScrollView Delegate
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) -> () {
        var page = round(scrollView.contentOffset.x / scrollView.frame.size.width)
        pageControl.currentPage = Int(page)
        scrollView.setContentOffset(CGPointMake(CGFloat(page) * UIScreen.mainScreen().bounds.width, 0.0), animated: true)
    }
}
