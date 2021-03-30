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
            
            self.id = "\(pokeDetail.id)"
            
            DispatchQueue.main.async {
                self.requestEvolution(id: "\(pokeDetail.id)")
                self.pokeName.text = self.data!.name + " #\(self.id!)"
            }
            
            self.pokeTypes.reloadData()
            self.pokeImages.reloadData()
            
        }

        
    }
    
}

extension StatsViewController {
    
        func requestStats(url: String) {
        
            
            AF.request(url).validate().responseDecodable(of: Detail.self) { (response) in
               guard let pokeStats = response.value else { print("ERRO")
                    return}
                
                self.stats = pokeStats.stats
                self.setStats()
            
            }
        
        }
            

func setStats() {

    
    for stat in self.stats {
        
            switch stat.pokeStat.name {
            case "hp":
                self.HP.setProgress(Float(stat.pokeBaseStat)/100, animated: true)
            case "attack":
                self.Attack.setProgress(Float(stat.pokeBaseStat)/100, animated: true)
            case "defense":
                self.Defense.setProgress(Float(stat.pokeBaseStat)/100, animated: true)
            case "special-attack":
                self.SAttack.setProgress(Float(stat.pokeBaseStat)/100, animated: true)
            case "special-defense":
                self.SDefense.setProgress(Float(stat.pokeBaseStat)/100, animated: true)
            case "speed":
                self.SAttack.setProgress(Float(stat.pokeBaseStat)/100, animated: true)
            default:
                self.HP.setProgress(Float(stat.pokeBaseStat)/100, animated: true)
            }
        
    
        }
    
    
    }
    
}

extension AbilitiesViewController {
    
    func requestAbilities(url: String) {
        
        AF.request(url).validate().responseDecodable(of: Detail.self) { (response) in
           guard let pokeAbilities = response.value else { print("ERRO")
                return}
            
            self.abilities = pokeAbilities.abilities
            
            self.abilitiesTable.reloadData()
        
        }
        
    }
    
}

extension EvolutionViewController {
    
    func requestEvolution(url: String) {
        
        AF.request(url).validate().responseDecodable(of: Chain.self) { (response) in
           guard let pokeEvolution = response.value else {
                return }
            
            print(pokeEvolution)
            
            DispatchQueue.main.async {
                self.evolution = pokeEvolution
                
                self.initEvolution(firstName: self.evolution.chain.species.name, secondName: self.evolution.chain.evolves_to[0].species.name, thirdName: self.evolution.chain.evolves_to[0].evolves_to[0].species.name)
            }
            

        
        }
        
    }
    
}
