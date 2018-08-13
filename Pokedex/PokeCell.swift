//
//  PokeCell.swift
//  Pokedex
//
//  Created by Eliza Vel Rosario on 13/08/2018.
//  Copyright © 2018 Eliza Velcom.eliza. All rights reserved.
//

import UIKit

class PokeCell: UICollectionViewCell {

    
    @IBOutlet weak var thumbImage: UIImageView!
    @IBOutlet weak var nameLbl: UILabel!
    
    var pokemon: Pokemon!
    
    func configureCell(pokemon: Pokemon){
        self.pokemon = pokemon
        nameLbl.text = self.pokemon.name.capitalizedString
        thumbImage.image = UIImage(named: "\(self.pokemon.pokedexId)")
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        layer.cornerRadius = 5.0
    }
    
    
}
