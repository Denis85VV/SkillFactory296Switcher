//
//  ViewController.swift
//  SwitchImage
//
//  Created by Denis on 22.02.2021.
//

import UIKit

class ViewController: UIViewController {
  
  let userDefaults = UserDefaults.standard
  
  let imageViewForSwitch: UIImageView = {
    let image = UIImageView()
    image.translatesAutoresizingMaskIntoConstraints = false
    return image
  }()
  
  let switcher: UISegmentedControl = {
    let items = ["Light", "Dark"]
    let segmentedControl = UISegmentedControl(items: items)
    segmentedControl.selectedSegmentIndex = 0
    segmentedControl.backgroundColor = .white
    segmentedControl.selectedSegmentTintColor = .green
    segmentedControl.addTarget(self, action: #selector(switchValueDidChange(_:)), for: .valueChanged)
    segmentedControl.translatesAutoresizingMaskIntoConstraints = false
    return segmentedControl
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    
    if userDefaults.bool(forKey: "switcher") == false {
      switcher.selectedSegmentIndex = 0
      lightMode()
    } else {
      switcher.selectedSegmentIndex = 1
      darkMode()
    }
    
    view.addSubview(imageViewForSwitch)
    view.addSubview(switcher)
    
    imageViewForSwitch.widthAnchor.constraint(equalToConstant: 250).isActive = true
    imageViewForSwitch.heightAnchor.constraint(equalToConstant: 330).isActive = true
    imageViewForSwitch.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    imageViewForSwitch.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    
    switcher.topAnchor.constraint(equalTo: imageViewForSwitch.bottomAnchor, constant: 20).isActive = true
    switcher.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
  }
  
  @objc func switchValueDidChange(_ sender: UISegmentedControl) {
    switch sender.selectedSegmentIndex {
    case 1:
      darkMode()
      userDefaults.set(true, forKey: "switcher")
    case 0:
      lightMode()
      userDefaults.set(false, forKey: "switcher")
    default:
      lightMode()
      userDefaults.set(false, forKey: "switcher")
    }
  }
  
  func lightMode() {
    view.backgroundColor = .white
    imageViewForSwitch.image = UIImage(named: "image1")
    print("Light mode is On")
  }
  
  func darkMode() {
    view.backgroundColor = .lightGray
    imageViewForSwitch.image = UIImage(named: "image2")
    print("Dark mode is On")
  }
}

