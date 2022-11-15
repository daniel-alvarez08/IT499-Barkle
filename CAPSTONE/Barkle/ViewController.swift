//
//  ViewController.swift
//  Barkle
//
//  Created by Daniel Alvarez on 9/10/22.
//

import UIKit
import AVFoundation
import SwiftUI

class ViewController: UIViewController {
    
    var dogs:[Dog] = []
    var dogIndex = -1
    
    var audioPlayer: AVAudioPlayer?
    
    //references UI element (main image)
    @IBOutlet weak var animalPicOne: UIImageView!
    
    @IBOutlet weak var dogName: UILabel!
    @IBOutlet weak var dogID: UILabel!
    @IBOutlet weak var dogStatus: UILabel!
    @IBOutlet weak var dogBreed: UILabel!
    @IBOutlet weak var dogSex: UILabel!
    @IBOutlet weak var dogAge: UILabel!
    @IBOutlet weak var dogLocation: UILabel!
    
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
            dogName.isHidden = false
            dogID.isHidden = false
            dogStatus.isHidden = false
            dogBreed.isHidden = false
            dogSex.isHidden = false
            dogAge.isHidden = false
            dogLocation.isHidden = false
            
            dogName.text = currentDog.Title
            dogID.text = currentDog.Number
            dogStatus.text = currentDog.animaldetailitem
            dogBreed.text = currentDog.animaldetailitem1
            dogSex.text = currentDog.animaldetailitem2
            dogAge.text = currentDog.animaldetailitem3
            dogLocation.text = currentDog.animaldetailitem4
            
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
        
        var vdogName: String = ""
        var vdogID: String = ""
        var vdogStatus: String = ""
        var vdogBreed: String = ""
        var vdogSex: String = ""
        var vdogAge: String = ""
        var vdogLocation: String = ""
        
        vdogName = dogName.text ?? ""
        vdogID = dogID.text ?? ""
        vdogStatus = dogStatus.text ?? ""
        vdogBreed = dogBreed.text ?? ""
        vdogSex = dogSex.text ?? ""
        vdogAge = dogAge.text ?? ""
        vdogLocation = dogLocation.text ?? ""
        
        print("xxxxxxxxxx")
        print(vdogName)
        
        showNextDog()
        
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
        
        dogName.isHidden = true
        dogID.isHidden = true
        dogStatus.isHidden = true
        dogBreed.isHidden = true
        dogSex.isHidden = true
        dogAge.isHidden = true
        dogLocation.isHidden = true

    }
    
}
