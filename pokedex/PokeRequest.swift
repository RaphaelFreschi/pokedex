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
            }else {
                self.items = pokedex.results
            }
            
            self.nextUrl = pokedex.next
            self.pokeTableView.reloadData()
        }
        
        
    }
    
    
}
