//
//  ViewController.swift
//  Barkle
//
//  Created by Daniel Alvarez on 9/10/22.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var dogs:[Dog] = []
    var dogIndex = -1
    
    var audioPlayer: AVAudioPlayer?
    
    //references UI element (main image)
    @IBOutlet weak var animalPicOne: UIImageView!
    
    @IBOutlet weak var loadingWidget: UIActivityIndicatorView!
    
    var checkPic = 0
    var xPic = 2
    
    // initiates loading spinner
    func showNextDog(){
        loadingWidget.isHidden = false
        loadingWidget.startAnimating()
        
        dogIndex += 1
        animalPicOne.image = nil
        let currentDog = dogs[dogIndex]
        
        // creates task to allow calling async
        Task{
            // getting image async
            let image = try await ImageDownloader.getImage(urlString: currentDog.Image)
            // showing image on main thread
            DispatchQueue.main.async {
                self.animalPicOne.image = image
                self.loadingWidget.isHidden = true
                self.loadingWidget.stopAnimating()
            }
        }
    }
    
    // when check is pressed, next picture is shown.
    @IBAction func checkPressed(_ sender: UIButton) {
        
        showNextDog()
        
        /*
        // Var allows us to change images of animals at a later time.
        var animalPicSetOne = [#imageLiteral(resourceName: "Umbreon"), #imageLiteral(resourceName: "umbreon2"), #imageLiteral(resourceName: "umbreon3")]
        
        // Array of images of animals        shows random images from within Array
        animalPicOne.image = animalPicSetOne.randomElement()
        checkPic += 1
        */
        
        // Attaches "yesbark" audio file to button
        guard let pathToSound = Bundle.main.path(forResource: "yesbark", ofType: "wav")
        else {
            return
        }
        let url = URL(fileURLWithPath: pathToSound)
        do{
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer?.play()
        } catch {}
        
    }
    // When X is pressed, the picture of another animal is shown.
    @IBAction func xPressed(_ sender: UIButton) {
        
        showNextDog()
        
        /*
        // Var allows us to change images of animals at a later time.
        var animalPicSetTwo = [#imageLiteral(resourceName: "kaneki"), #imageLiteral(resourceName: "kaneki3"), #imageLiteral(resourceName: "kaneki2")]
        
        // Array of images of more animals   shows random images from within Array
        animalPicOne.image = animalPicSetTwo.randomElement()
        xPic -= 1
         */
        
        // Attaches "nobark" audio file to button
        guard let pathToSound = Bundle.main.path(forResource: "nobark", ofType: "wav")
        else{
            return
        }
        let url = URL(fileURLWithPath: pathToSound)
        do{
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer?.play()
        } catch {}
    }
    //The below keeps the screen orientated in portrait mode permanently.
    override var shouldAutorotate: Bool {
        return false
    }
    //as above
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask{
        return .portrait
    }
    @IBAction func favoritePressed(_ sender: Any) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dogs = JsonLoader.getDogs()
        guard let firstDog = dogs.first else { return }
        print(firstDog.Title)
        print(firstDog.animaldetailitem)
        

    }
    
}


