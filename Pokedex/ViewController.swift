//
//  ViewController.swift
//  Pokedex
//
//  Created by Eliza Vel Rosario on 07/08/2018.
//  Copyright © 2018 Eliza Velcom.eliza. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, UICollectionViewDelegate,UICollectionViewDataSource,UISearchBarDelegate {

    @IBOutlet weak var collection: UICollectionView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    var isInSearchMode = false;
    var pokemon: [Pokemon] = []
    var searchPokemon: [Pokemon] = []
    var musicPlayer: AVAudioPlayer!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        collection.dataSource = self
        collection.delegate = self
        
        parsePokemonCSV()
       // initAudio()
    }
    
    
    func initAudio(){
        let path = NSURL( fileURLWithPath: NSBundle.mainBundle().pathForResource("music", ofType: "mp3")!)
        do{
            musicPlayer = try AVAudioPlayer(contentsOfURL: path)
            musicPlayer.prepareToPlay()
            musicPlayer.numberOfLoops = -1
            musicPlayer.play()
            
        }catch let err as NSError{
            print(err.debugDescription)
        }
    }
    
    func parsePokemonCSV(){
        
        let path = NSBundle.mainBundle().pathForResource("pokemon", ofType: "csv")
        
        do{
            let csv = try CSV(contentsOfURL: path!)
            let rows = csv.rows
            
            for row in rows {
                let pokeId = Int(row["id"]!)
                let name = row["identifier"]!
                
                let poke = Pokemon (name: name,pokedexId: pokeId!)
                pokemon.append(poke)
            }
            

            
        }catch let err as NSError{
            print(err.debugDescription)
        }
    }

    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCellWithReuseIdentifier("PokeCell", forIndexPath: indexPath) as? PokeCell{
            
            //dynamic
            let poke = pokemon[indexPath.row]
            
            cell.configureCell(poke)
            
            return cell
        }else{
            return UICollectionViewCell()
        }
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        //
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       return  pokemon.count
    }
    
    override func sizeForChildContentContainer(container: UIContentContainer, withParentContainerSize parentSize: CGSize) -> CGSize {
        
        return CGSize(width: 105,height: 105)
    }
    
    
    @IBAction func musicBtnPressed(sender: UIButton) {
        
        if(musicPlayer.playing){
            musicPlayer.stop()
            sender.alpha = 0.2
        }else{
            musicPlayer.play()
            sender.alpha = 1.0
        }
        
    }
    
    func searchBarTextDidEndEditing(searchBar: UISearchBar) {
        if(searchBar.text != nil || searchBar.text != ""){
            isInSearchMode = true
            
            
            
        }else{
            isInSearchMode = false
        }
    }

}

