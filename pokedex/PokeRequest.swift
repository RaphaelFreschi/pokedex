//
//  PokeRequest.swift
//  pokedex
//
//  Created by Raphael Freschi on 29/03/21.
//

import Foundation
import Alamofire

extension ViewController {
    
    func requestAllwithPagination(url: String){
        
        AF.request(url).validate().responseDecodable(of: Pokemon.self) { (response) in
            guard let pokedex = response.value else {return}

            if self.nextUrl != "" {
                self.items.append(contentsOf: pokedex.results)
            } else {
                self.items = pokedex.results
            }
            
            self.nextUrl = pokedex.next
            self.pokeTableView.reloadData()
        }
        
        
    }
    
}

extension DetailViewController {
    
    func requestDetails(url: String) {
        

        AF.request(url).validate().responseDecodable(of: Detail.self) { (response) in
           guard let pokeDetail = response.value else { print("ERRO")
                return}
            
            self.types = pokeDetail.types
            self.stats = pokeDetail.stats
            
            self.setStats()
            
            self.pokeTypes.reloadData()
            self.pokeImages.reloadData()
            
        }

        
    }
    
    func setStats() {
  
        
        for stat in self.stats {
            
//            switch stat.pokeStat.name {
//            case "hp":
//                self.HP.setProgress(Float(stat.pokeBaseStat), animated: true)
//            case "attack":
//                self.Attack.setProgress(Float(stat.pokeBaseStat), animated: true)
//            case "defense":
//                self.Defense.setProgress(Float(stat.pokeBaseStat), animated: true)
//            case "special-attack":
//                self.SAttack.setProgress(Float(stat.pokeBaseStat), animated: true)
//            case "special-defense":
//                self.SDefense.setProgress(Float(stat.pokeBaseStat), animated: true)
//            case "speed":
//                self.Speed.setProgress(Float(stat.pokeBaseStat), animated: true)
//            default:
//                print("N/A Stats")
//            }
            
        }
        

        
//        statsController.HP.setProgress(hp/100, animated: true)
//        statsController.attack.setProgress(attack/100, animated: true)
//        statsController.defense.setProgress(defense/100, animated: true)
//        statsController.sAttack.setProgress(sAttack/10, animated: true)
//        statsController.sDefense.setProgress(sDefense/100, animated: true)
//        statsController.speed.setProgress(speed/100, animated: true)
        
        
    }
    
    
}
