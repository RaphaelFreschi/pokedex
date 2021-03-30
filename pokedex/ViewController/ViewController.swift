//
//  ViewController.swift
//  pokedex
//
//  Created by Raphael Freschi on 28/03/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var pokeTableView: UITableView!		
    @IBAction func refreshData(_ sender: Any) {
        self.view.layoutIfNeeded()
    }
    
    var items: [Displayable] = []
    var pokeWithType: DisplayableWithType!
    var selectedItem: Displayable?
    var nextUrl = ""
    var type = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        configComponents()
        
        
        requestAllwithPagination(url: "https://pokeapi.co/api/v2/pokemon")
    
        
    
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destinationVC = segue.destination as? DetailViewController else {
          return
        }
        
        
        
        destinationVC.data = selectedItem
    }
    
    func configComponents() {
        pokeTableView.dataSource = self
        pokeTableView.delegate = self
        pokeTableView.register(UINib(nibName: "PokeCell", bundle: nil), forCellReuseIdentifier: "pokedexCell")
    }
    
}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(self.items.count)
        return self.items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "pokedexCell", for: indexPath) as! PokeTableViewCell
        
        cell.pokeName.text = self.items[indexPath.row].name
        cell.pokeImage.downloadedFrom(url: URL(string: "https://img.pokemondb.net/sprites/x-y/normal/\(self.items[indexPath.row].name).png")!)
        
        return cell
    }
    
    
}

extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        print(indexPath.row)
        selectedItem = items[indexPath.row]
        
        let stats = StatsViewController()
        stats.data = selectedItem
        
        performSegue(withIdentifier: "listToDetail", sender: nil)
        
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let position  = scrollView.contentOffset.y
        if position > (pokeTableView.contentSize.height - 100 - scrollView.frame.size.height) {
            
            if self.nextUrl != "" {
                requestAllwithPagination(url: self.nextUrl)
                pokeTableView.reloadData()
            }
        }
    }
}

