//
//  ViewController.swift
//  Barkle
//
//  Created by Daniel Alvarez on 9/10/22.
//

import UIKit

class ViewController: UIViewController {
    
    //references UI element (main image)
    @IBOutlet weak var animalPicOne: UIImageView!
    
    var slayPic = 0
    var noSlayPic = 2
    
    // when Slay is pressed, next picture is shown.
    @IBAction func slayPressed(_ sender: UIButton) {
        
        // Var allows us to change images of animals at a later time.
        var animalPicSetOne = [#imageLiteral(resourceName: "Umbreon"), #imageLiteral(resourceName: "umbreon2"), #imageLiteral(resourceName: "umbreon3")]
        
        // Array of images of animals        shows random images from within Array
        animalPicOne.image = animalPicSetOne.randomElement()
        slayPic += 1
    }
    // When No Slay is pressed, the picture of another animal is shown.
    @IBAction func noSlayPressed(_ sender: UIButton) {
        
        // Var allows us to change images of animals at a later time.
        var animalPicSetTwo = [#imageLiteral(resourceName: "kaneki"), #imageLiteral(resourceName: "kaneki3"), #imageLiteral(resourceName: "kaneki2")]
        
        // Array of images of more animals   shows random images from within Array
        animalPicOne.image = animalPicSetTwo.randomElement()
        noSlayPic -= 1
    }
}

