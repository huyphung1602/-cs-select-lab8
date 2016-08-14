//
//  ViewController.swift
//  PokeLab
//
//  Created by Chau Vo on 8/14/16.
//  Copyright © 2016 Chau Vo. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

  @IBOutlet weak var firstButton: UIButton!
  @IBOutlet weak var secondButton: UIButton!
  @IBOutlet weak var thirdButton: UIButton!

  var selectedIndex = 0
  var buttons: [UIButton]!
  var pokemons = ["Pikachu", "Teropi", "Psyduck"]

  override func viewDidLoad() {
    super.viewDidLoad()

    buttons = [firstButton, secondButton, thirdButton]
    updateButton()
  }

  func updateButton() {
    for (index, button) in buttons.enumerate() {
      index == selectedIndex ? button.setDefaultBorder() : button.clearDefaultBorder()
    }
  }

  @IBAction func onPokemonButtonTapped(sender: UIButton) {
    switch sender {
    case firstButton: selectedIndex = 0
    case secondButton: selectedIndex = 1
    case thirdButton: selectedIndex = 2
    default: break
    }
    updateButton()
  }


  @IBAction func onNotifyButtonTapped(sender: UIButton) {
    let notification = UILocalNotification()
    notification.alertBody = "\(pokemons[selectedIndex]) is nearby."
    notification.fireDate = NSDate(timeIntervalSinceNow: 10)
    notification.soundName = UILocalNotificationDefaultSoundName
    notification.userInfo = ["selectedIndex": selectedIndex]
    UIApplication.sharedApplication().scheduleLocalNotification(notification)
  }

}
