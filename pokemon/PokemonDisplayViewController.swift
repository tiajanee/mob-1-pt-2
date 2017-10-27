//
//  PokemonDisplayViewController.swift


import UIKit

class PokemonDisplayViewController: UIViewController {

    @IBOutlet weak var guessedPokemon: UILabel!
    @IBOutlet weak var pokeDisplayImageVIew: UIImageView!
    static let pokemons = [
        Pokemon(name: "Charmander", shadowImage: UIImage(named: "char_shadow")!, actualImage: UIImage(named: "char")!),
        Pokemon(name: "Psyduck", shadowImage: UIImage(named: "psy_shadow")!, actualImage: UIImage(named: "psy")!),
        Pokemon(name: "Horsea", shadowImage: UIImage(named: "seadra_shadow")!, actualImage: UIImage(named: "seadra")!),
        Pokemon(name: "Dragonaire", shadowImage: UIImage(named: "dragonaire_shadow")!, actualImage: UIImage(named: "dragonaire")!)
    ]
    
    var selectedPokemon: Pokemon?
    var displayedPokemon: Pokemon = randomPoke()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pokeDisplayImageVIew.image = displayedPokemon.shadowImage
       
    }
    
    
    static func randomPoke() -> Pokemon {
        let index = Int(arc4random()) % pokemons.count
        return pokemons[index]
    }
    
    func goToChoosePokemonViewController() {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        let choosePokemonController = storyboard.instantiateViewController(withIdentifier: "ChoosePokemonViewController") as! ChoosePokemonTableViewController
        
        choosePokemonController.pokemons = PokemonDisplayViewController.pokemons
        
        // TODO: Make sure to set the delete on the ChoosePokemonViewController
        
    self.navigationController?.pushViewController(choosePokemonController, animated: true)
        
    }
    
    
    /*
         Checks if the selected pokemon from the delegate matches the displayed pokemon
         - Run this when your delegate method is called
    */
    func checkGuessedPokemonAndShowPokemon() {
        guard let selectedPokemon = selectedPokemon else {return}
        if selectedPokemon == displayedPokemon {
            guessedPokemon.text = "Correct guess!"
        } else {
            guessedPokemon.text = "Incorrect guess!"
        }
        
        pokeDisplayImageVIew.image = displayedPokemon.actualImage
        
        displayedPokemon = PokemonDisplayViewController.randomPoke()
    }
    
    @IBAction func choosePokemon(_ sender: UIButton) {
        goToChoosePokemonViewController()
    }
}
