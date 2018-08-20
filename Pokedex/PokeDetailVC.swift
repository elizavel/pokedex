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
    @IBOutlet weak var pokeBioSegment: UISegmentedControl!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var thumbImg: UIImageView!
    @IBOutlet weak var descriptionLbl: UILabel!
    @IBOutlet weak var typeLbl: UILabel!
    @IBOutlet weak var heightLbl: UILabel!
    @IBOutlet weak var weightLbl: UILabel!
    @IBOutlet weak var defenseLbl: UILabel!
    @IBOutlet weak var pokedexId: UILabel!
    @IBOutlet weak var baseAttackLbl: UILabel!
    @IBOutlet weak var currentImg: UIImageView!
    @IBOutlet weak var evolutionImg: UIImageView!
    @IBOutlet weak var evolutionLbl: UILabel!

    
    override func viewDidLoad() {
    
        nameLbl.text = pokemon.name.capitalizedString
        
    }
    
    @IBAction func backBtnPressed(_sender: UIButton){
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    
}
