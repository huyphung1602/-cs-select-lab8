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

  var selectedIndex: Int?

  override func viewDidLoad() {
    super.viewDidLoad()

    if let selectedIndex = selectedIndex {
      pokemonImageView.image = UIImage(named: pokemons[selectedIndex])
    }
  }

}
