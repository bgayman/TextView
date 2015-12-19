//
//  TableViewController.swift
//  textView
//
//  Created by Brad G. on 12/18/15.
//  Copyright © 2015 Brad G. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.estimatedRowHeight = 500
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell:TextViewTableViewCell = tableView.dequeueReusableCellWithIdentifier("TextViewCell", forIndexPath: indexPath) as! TextViewTableViewCell
        var size:CGSize
        if self.view.bounds.size == CGSizeMake(600, 600) // check if self.view frame has been set yet (600,600) is IB default
        {
            //cellForRowAtIndexPath will likely get called before self.view.frame has been set, so use screen-size as work around
            size = cell.textView.sizeThatFits(CGSizeMake(UIScreen.mainScreen().bounds.size.width, CGFloat.max))
        }
        else
        {
            size = cell.textView.sizeThatFits(CGSizeMake(self.tableView.bounds.size.width, CGFloat.max))
        }
        cell.textViewHeightConstraint.constant = size.height+8.0 //add some padding
        return cell
    }

}
