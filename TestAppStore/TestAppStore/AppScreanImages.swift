//
//  AppScreanImages.swift
//  TestAppStore
//
//  Created by Moonbeom KWON on 2017. 4. 17..
//  Copyright © 2017년 Kyle. All rights reserved.
//

import Foundation
import UIKit
import ImageSlideshow
import AlamofireImage

class AppScreanImages: UITableViewCell {
    
    var imageSlide: ImageSlideshow?
    var superViewController: UIViewController?
    
    func setInfo(_ itemInfo: AppDetailModel?) {
        
        guard let imageArray = itemInfo?.screenshotUrls?.map({ (imageUrl) -> AlamofireSource in
            return AlamofireSource(urlString: imageUrl)!
            
        }) else {
            return
        }
        
        imageSlide?.setImageInputs(imageArray)
    }
}


extension AppScreanImages {
    override func layoutSubviews() {
        super.layoutSubviews()
        if imageSlide == nil {
            imageSlide = ImageSlideshow(frame: self.bounds)
            self.contentView.addSubview(imageSlide!)
            
            let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.didTap))
            imageSlide?.addGestureRecognizer(gestureRecognizer)
        }
    }
    
    func didTap() {
        imageSlide?.presentFullScreenController(from: superViewController!)
    }
}
