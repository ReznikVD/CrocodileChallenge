//
//  ViewController.swift
//  CrocodileChallenge
//
//  Created by Владислав Резник on 17.04.2023.
//

import UIKit

class MainViewController: UIViewController {
    
    // MARK: - Subviews
    
    private lazy var crocodileImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: Resources.Images.bigCrocodile)
        imageView.contentMode = .scaleAspectFill
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    private lazy var backgroundImage: UIImageView = {
        let image = UIImageView(image: UIImage(named: Resources.Images.background))
        image.contentMode = .scaleAspectFill
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private lazy var leavesImageFirst: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: Resources.Images.grass)
        imageView.contentMode = .scaleAspectFill
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    private lazy var leavesImageSecond: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: Resources.Images.grass)
        imageView.contentMode = .scaleAspectFill
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    private lazy var startButton: CustomButton = {
        let button = CustomButton(title: "Старт игры", color: UIColor(named: Resources.Colors.green)!)
        return button
    }()
    
    private lazy var rulesButton: CustomButton = {
        let button = CustomButton(title: "Правила", color: UIColor(named: Resources.Colors.green)!)
        return button
    }()
    
    // MARK: - Hide Back text
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        // Скрываем текст "Back"
        let backButton = UIBarButtonItem(title: " ", style: .plain, target: nil, action: nil)
        navigationItem.backBarButtonItem = backButton
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addViews()
        configureButtons()
    }
}
    // MARK: - Private Extension

    private extension MainViewController {
        
        func setupConstraints() {
            NSLayoutConstraint.activate([
                backgroundImage.topAnchor.constraint(equalTo: view.topAnchor),
                backgroundImage.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                backgroundImage.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                backgroundImage.bottomAnchor.constraint(equalTo: view.bottomAnchor),
                
                crocodileImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 172),
                crocodileImage.heightAnchor.constraint(equalToConstant: 322),
                crocodileImage.widthAnchor.constraint(equalToConstant: 268),
                crocodileImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                
                startButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -192),
                startButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 51),
                startButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
                startButton.heightAnchor.constraint(equalToConstant: 83),
                
                rulesButton.topAnchor.constraint(equalTo: startButton.bottomAnchor, constant: 39),
                rulesButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                rulesButton.heightAnchor.constraint(equalToConstant: 63),
                rulesButton.widthAnchor.constraint(equalToConstant: 211),
                
                leavesImageFirst.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
                leavesImageFirst.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
                leavesImageFirst.heightAnchor.constraint(equalToConstant: 70),
                leavesImageFirst.widthAnchor.constraint(equalToConstant: 95),
                
                leavesImageSecond.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
                leavesImageSecond.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
                leavesImageSecond.heightAnchor.constraint(equalToConstant: 70),
                leavesImageSecond.widthAnchor.constraint(equalToConstant: 95),
          ])
    }
        
        func addViews() {
            view.addSubview(backgroundImage)
            view.addSubview(crocodileImage)
            view.addSubview(startButton)
            view.addSubview(rulesButton)
            view.addSubview(leavesImageFirst)
            view.addSubview(leavesImageSecond)
            //view.sendSubviewToBack(backgroundImage)
            setupConstraints()
        }
        
        private func configureButtons() {
            startButton.addTarget(self, action: #selector(startButtonAction), for: .touchUpInside)
        }
        
        @objc
        private func startButtonAction(){
            let vc = TeamViewController() 
            navigationController?.pushViewController(vc, animated: true)
        }
    }

