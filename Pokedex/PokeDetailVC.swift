//
//  PokeDetailVC.swift
//  Pokedex
//
//  Created by Eliza Vel Rosario on 16/08/2018.
//  Copyright © 2018 Eliza Velcom.eliza. All rights reserved.
//

import UIKit

class PokeDetailVC: UIViewController {

    var pokemon : Pokemon!
    @IBOutlet weak var nameLbl: UILabel!
    
    override func viewDidLoad() {
    
        nameLbl.text = pokemon.name
        
    }
}
