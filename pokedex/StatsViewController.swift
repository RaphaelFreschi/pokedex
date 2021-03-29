//
//  StatsViewController.swift
//  pokedex
//
//  Created by Raphael Freschi on 29/03/21.
//

import UIKit

class StatsViewController: UIViewController {

    @IBOutlet weak var HP: UIProgressView!
    @IBOutlet weak var Attack: UIProgressView!
    @IBOutlet weak var Defense: UIProgressView!
    @IBOutlet weak var SAttack: UIProgressView!
    @IBOutlet weak var SDefense: UIProgressView!
    @IBOutlet weak var Speed: UIProgressView!
    
    var hpView: Float = 0.0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        DispatchQueue.main.async {
            if self.HP != nil {
                
                self.HP.setProgress(0.1, animated: true)
            }
        }
        
    }
    
    
    func initProgress(hp: Float!, attack: Float!, defense: Float!, sAttack: Float!, sDefense: Float!, speed: Float!) {
        print(hp/100)
        print(attack/100)
        print(defense/100)
        print(sAttack/100)
        print(sDefense/100)
        print(speed/100)
        
        self.hpView = hp
        
        DispatchQueue.main.async {
            if self.HP != nil {
                self.HP.setProgress(hp/255, animated: true)
            }
            
            if self.Attack != nil {
                self.Attack.setProgress(hp/255, animated: true)
            }
            
            if self.Defense != nil {
                self.Defense.setProgress(hp/255, animated: true)
            }
            
            if self.SAttack != nil {
                self.SAttack.setProgress(hp/255, animated: true)
            }
            
            if self.SDefense != nil {
                self.SDefense.setProgress(hp/255, animated: true)
            }
            
            if self.Speed != nil {
                self.Speed.setProgress(hp/255, animated: true)
            }
        }
        
        
//        self.attack.setProgress(attack/100, animated: true)
//        self.defense.setProgress(defense/100, animated: true)
//        self.sAttack.setProgress(sAttack/10, animated: true)
//        self.sDefense.setProgress(sDefense/100, animated: true)
//        self.speed.setProgress(speed/100, animated: true)
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
