//
//  CatchViewController.swift
//  PokeLab
//
//  Created by Chau Vo on 8/14/16.
//  Copyright © 2016 Chau Vo. All rights reserved.
//

import UIKit

class CatchViewController: UIViewController {

  @IBOutlet weak var pokemonImageView: UIImageView!
  @IBOutlet weak var ballImageView: UIImageView!

  var originalBallCenter: CGPoint!

  override func viewDidLoad() {
    super.viewDidLoad()

    let userDefaults = NSUserDefaults.standardUserDefaults()
    let selectedIndex = userDefaults.integerForKey(selectedIndexKey)
    pokemonImageView.image = UIImage(named: pokemons[selectedIndex])
  }

  @IBAction func onBallPanned(sender: UIPanGestureRecognizer) {
    let state = sender.state
    let translation = sender.translationInView(view)

    switch state {
    case .Began:
      originalBallCenter = ballImageView.center

    case .Changed:
      ballImageView.center = CGPoint(x: originalBallCenter.x + translation.x, y: originalBallCenter.y + translation.y)

    case .Ended:
      if CGRectIntersectsRect(ballImageView.frame, pokemonImageView.frame) {
        UIView.animateWithDuration(1, delay: 0, usingSpringWithDamping: 0.1, initialSpringVelocity: 2, options: [], animations: {
          self.pokemonImageView.transform = CGAffineTransformMakeScale(1.1, 1.1)
          }, completion: { finished in
            UIView.animateWithDuration(1, animations: {
              self.pokemonImageView.center = self.ballImageView.center
              self.pokemonImageView.transform = CGAffineTransformMakeScale(0.01, 0.01)
              self.pokemonImageView.alpha = 0
            })
        })
      } else {
        UIView.animateWithDuration(2, delay: 0, usingSpringWithDamping: 0.1, initialSpringVelocity: 2, options: [], animations: {
          self.ballImageView.center = self.originalBallCenter
          }, completion: nil)
      }

    default:
      break
    }
  }

  @IBAction func onBackButtonTapped(sender: UIButton) {
    dismissViewControllerAnimated(true, completion: nil)
  }

}
