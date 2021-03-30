//
//  EvolutionViewController.swift
//  pokedex
//
//  Created by Raphael Freschi on 29/03/21.
//

import UIKit

class EvolutionViewController: UIViewController {

    @IBOutlet var firstEvoImage: UIImageView!
    @IBOutlet var secondEvoImage: UIImageView!
    @IBOutlet var thirdEvoImage: UIImageView!
    
    @IBOutlet var firstText: UILabel!
    @IBOutlet var secondText: UILabel!
    @IBOutlet var thirdText: UILabel!
    
    var evolution: DisplayableEvolution!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        // Do any additional setup after loading the view.
    }
    
    func initEvolution(firstName: String, secondName: String, thirdName: String) {
        self.firstText.text = firstName
        self.secondText.text = secondName
        self.thirdText.text = thirdName
        
        self.firstEvoImage.downloadedFrom(url: URL(string: "https://img.pokemondb.net/sprites/x-y/normal/\(firstName).png")!)
        self.secondEvoImage.downloadedFrom(url: URL(string: "https://img.pokemondb.net/sprites/x-y/normal/\(secondName).png")!)
        self.thirdEvoImage.downloadedFrom(url: URL(string: "https://img.pokemondb.net/sprites/x-y/normal/\(thirdName).png")!)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
