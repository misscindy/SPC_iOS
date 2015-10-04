//
//  EventTableCardCell.swift
//  SPCV1
//
//  Created by Cindy Fan on 9/11/15.
//  Copyright (c) 2015 Cindy Fan. All rights reserved.
//

import UIKit

class EventTableCardCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var secondaryTitleLabel: UILabel!
    @IBOutlet weak var eventImage: UIImageView!
    @IBOutlet weak var descriptionTextView: UITextView!
    
    @IBOutlet weak var cardView: UIView!
    
    
    
    override func layoutSubviews() {
        setupCard()
        setupImage()
        setupTitleLabel()
        setupDescriptionLabel()
    }
    
    func setupCard() {
        cardView.alpha = 1
        cardView.layer.masksToBounds = false
        
        // Shadow
        cardView.layer.shadowOffset = CGSizeMake(-0.2, 0.2)
        cardView.layer.shadowRadius = 2
        cardView.layer.cornerRadius = 2
        cardView.layer.shadowOpacity = 0.4
    }
    
    func setupImage() {
        eventImage.clipsToBounds = true
        eventImage.contentMode = UIViewContentMode.ScaleAspectFit
        eventImage.backgroundColor = UIColor.whiteColor()
    }
    
    func setupTitleLabel() {
        titleLabel.layer.masksToBounds = true
    }
    
    func setupDescriptionLabel() {}
}
