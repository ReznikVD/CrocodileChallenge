//
//  TeamViewController.swift
//  CrocodileChallenge
//
//  Created by Владислав Резник on 17.04.2023.
//

import UIKit

class TeamViewController: UIViewController {

    
    private let backgroundImage: UIImageView = {
        
       let image = UIImageView(image: UIImage(named: "background"))
        image.contentMode = .scaleAspectFill
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    func addviewLayout() {
        view.addSubview(backgroundImage)
        view.sendSubviewToBack(backgroundImage)
        
        NSLayoutConstraint.activate([
            backgroundImage.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundImage.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundImage.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundImage.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        addviewLayout()
    }
}
