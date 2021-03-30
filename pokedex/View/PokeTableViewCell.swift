//
//  PokeTableViewCell.swift
//  pokedex
//
//  Created by Raphael Freschi on 28/03/21.
//

import UIKit

class PokeTableViewCell: UITableViewCell {

    @IBOutlet var pokeImage: UIImageView!
    @IBOutlet var pokeName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        pokeName.text = "Bulbasaur"
        pokeImage.image = UIImage(named: "bulbasaur")
    }
    
    func initCell(name: String){
        self.pokeName.text = name
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
        
    }
    
}
