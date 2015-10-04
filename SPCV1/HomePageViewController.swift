//
//  HomePageViewController.swift
//  SPCV1
//
//  Created by Cindy Fan on 9/11/15.
//  Copyright (c) 2015 Cindy Fan. All rights reserved.
//

import UIKit

class HomePageViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var eventsTableView: UITableView!
    var feeds: [Feed] = []
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)
        self.eventsTableView.contentInset = UIEdgeInsetsMake(0, 0, 0, 0)
        self.automaticallyAdjustsScrollViewInsets = false
        feeds =
            [
                Feed(primaryTitle: "1号选手", secondaryTitle: "🐑🐑", content: "I am not going down without a fight", image: "miamia"),
                Feed(primaryTitle: "2号选手", secondaryTitle: "🐶🐶", content: "Can we play dominion?", image: "cindy"),
                Feed(primaryTitle: "3号选手", secondaryTitle: "💩💩", content: "Let's play a game, and poooooooooooh. Let's play a game, and poooooooooooh. Let's play a game, and poooooooooooh. Let's play a game, and poooooooooooh. Let's play a game, and poooooooooooh. Let's play a game, and poooooooooooh. end", image: "yaya"),
                Feed(primaryTitle: "3号选手", secondaryTitle: "💩💩", content: "Let's play a game, and poooooooooooh. Let's play a game, and poooooooooooh. Let's play a game, and poooooooooooh. Let's play a game, and poooooooooooh. Let's play a game, and poooooooooooh. Let's play a game, and poooooooooooh. end", image: "yaya"),
                Feed(primaryTitle: "4号选手", secondaryTitle: "seedoo", content: "Let's play a game, and poooooooooooh. Let's play a game, and poooooooooooh. Let's play a game, and poooooooooooh. Let's play a game, and poooooooooooh. Let's play a game, and poooooooooooh. Let's play a game, and poooooooooooh. end", image: "seedoo"),
                Feed(primaryTitle: "5号选手", secondaryTitle: "alashn", content: "Let's play a game, and poooooooooooh. Let's play a game, and poooooooooooh. Let's play a game, and poooooooooooh. Let's play a game, and poooooooooooh. Let's play a game, and poooooooooooh. Let's play a game, and poooooooooooh. end", image: "yaya")
            ]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    // MARK: - UITableView Data Source
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return feeds.count + 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        if (indexPath.row == 0) {
            var cell = eventsTableView.dequeueReusableCellWithIdentifier("SliderCell") as! SliderTableCell
            cell.setSliderImages([UIImage(named: "product"), UIImage(named: "product2")])
            return cell
        }
        else {
            var feed = feeds[indexPath.row - 1]
            var cell = eventsTableView.dequeueReusableCellWithIdentifier("EventTableCardCell") as! EventTableCardCell
//            var cell = EventTableCardCell(style:UITableViewCellStyle.Subtitle, reuseIdentifier:"EventTableCardCell")
            cell.titleLabel.text = feed.primaryTitle
            cell.secondaryTitleLabel.text = feed.secondaryTitle
            cell.descriptionTextView.text = feed.content
            cell.eventImage.image = UIImage(named: feed.image)
            return cell
        }
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if (indexPath.row == 0) {
            return 220
        } else {
            return 180
        }
    }
//
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
