//
//  ViewController.swift
//  SwipeViewDemo
//
//  Created by projas on 7/19/16.
//  Copyright © 2016 nearsoft. All rights reserved.
//

import UIKit
import MapKit
import SeamlessSlideUpScrollView

class ViewController: UIViewController {

  
  @IBOutlet var tableView: SeamlessSlideUpTableView!
  @IBOutlet weak var slideUpView: SeamlessSlideUpView!

  @IBOutlet weak var infoView: UIView!
  @IBOutlet weak var map: MKMapView!
  private let mainColor = UIColor(red: 10/255, green: 137/255, blue: 169/255, alpha: 1)
  private let secondaryColor = UIColor(red: 23.8/255, green: 159.8/255, blue: 206.8/255, alpha: 1.0)
  
  @IBOutlet weak var showRideButton: UIButton!
  @IBOutlet weak var shareMyRideButton: UIButton!
  


  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    infoView.backgroundColor = secondaryColor//.colorWithAlphaComponent(0.8)
    
    showRideButton.layer.cornerRadius = 20
    showRideButton.layer.masksToBounds = true
    showRideButton.backgroundColor = secondaryColor
    
    shareMyRideButton.layer.cornerRadius = 20
    shareMyRideButton.layer.masksToBounds = true
    
    tableView.dataSource = self
    tableView.reloadData()

    
    slideUpView.tableView = tableView
    slideUpView.delegate = self
    slideUpView.topWindowHeight = self.view.frame.size.height/2
    
    customizeNavigationBar()
    customizeTabBar()
  }
  
  func customizeNavigationBar() {
    self.navigationController?.navigationBar.tintColor = mainColor
    self.navigationController?.navigationBar.barTintColor = mainColor
    self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName : UIColor.whiteColor()]

    removerBordersFromNavigationBar()
  }
  
  func customizeTabBar() {
    self.tabBarController?.tabBar.barTintColor = mainColor
    self.tabBarController?.tabBar.tintColor = UIColor.whiteColor()
    
  }


  func removerBordersFromNavigationBar() {
    for parent in self.navigationController!.navigationBar.subviews {
      for childView in parent.subviews {
        if(childView is UIImageView) {
          childView.removeFromSuperview()
        }
      }
    }
  }
  
  
  @IBAction func toggleSlideUpView(sender: AnyObject) {
    if self.slideUpView.hidden {
      self.slideUpView.show(expandFull: false)
      self.slideUpView.show()
    } else {
      self.slideUpView.hide()
    }
  }

}

extension ViewController: SeamlessSlideUpViewDelegate{
  func slideUpViewWillAppear(slideUpView: SeamlessSlideUpView, height: CGFloat) {
    UIView.animateWithDuration(0.2) { [weak self] in self?.view.layoutIfNeeded() }
  }
  
  func slideUpViewDidAppear(slideUpView: SeamlessSlideUpView, height: CGFloat) {
  }
  
  func slideUpViewWillDisappear(slideUpView: SeamlessSlideUpView) {
    UIView.animateWithDuration(0.2) { [weak self] in self?.view.layoutIfNeeded() }
  }
  
  func slideUpViewDidDisappear(slideUpView: SeamlessSlideUpView) {
  }
  
  func slideUpViewDidDrag(slideUpView: SeamlessSlideUpView, height: CGFloat) {
    self.view.layoutIfNeeded()
  }
}

extension ViewController: UITableViewDataSource {
  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 10
  }
  
  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)

    return cell
  }
  
}

