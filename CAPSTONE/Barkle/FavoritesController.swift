//
//  FavoritesController.swift
//  Barkle
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
