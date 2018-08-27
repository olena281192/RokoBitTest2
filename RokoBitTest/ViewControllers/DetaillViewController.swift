//
//  DetaillViewController.swift
//  RokoBitTest
//
//  Created by Olena Demkovska on 8/23/18.
//  Copyright © 2018 Olena Demkovska. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage

class DetaillViewController: UIViewController {

    
    // MARK: Outlet
    
    @IBOutlet private weak var viewProfile: UIView!
    @IBOutlet private weak var image: UIImageView!
    @IBOutlet private weak var fullName: UILabel!
    
    private var user = Profile()
    

     // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        if let usr = CoreDataManager.getUser() {
            user = usr
            setupUI()
        }
    }
    
    // MARK: Actions

    @IBAction func logOutButtonPressed(_ sender: UIBarButtonItem) {
        CoreDataManager.deteUser()
        navigationController?.popToRootViewController(animated: false)
    }

}

// MARK: Setup UI
extension DetaillViewController {
    func setupUI() {
        if let firstName = user.firstName, let lastName = user.lastName {
            fullName.text = "\(firstName) \(lastName)"
        }
        if let url = URL(string:(user.avatar)!) {
            self.image.af_setImage(withURL: url)
        }

        image.layer.cornerRadius = image.frame.height / 2
        image.clipsToBounds = true
    }
}
