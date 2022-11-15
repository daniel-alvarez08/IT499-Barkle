//
//  FavoritesController.swift
//  Barkle
//
//  Created by Daniel Alvarez on 10/22/22.
//

import UIKit
import SwiftUI

class FavoritesController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    // when close button is tapped, screen closes.
    @IBAction func closeTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
