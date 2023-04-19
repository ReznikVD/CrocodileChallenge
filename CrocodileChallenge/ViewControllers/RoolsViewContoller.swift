//
//  RoolsViewContoller.swift
//  CrocodileChallenge
//
//  Created by Владислав Резник on 17.04.2023.
//

import UIKit

class RoolsViewContoller: UIViewController {
    // MARK: - Subviews
    
    private lazy var rulesScrollView: UIScrollView = {
        let rulesScrollView = UIScrollView()
        rulesScrollView.backgroundColor = .green
        rulesScrollView.translatesAutoresizingMaskIntoConstraints = false
        
        return rulesScrollView
    }()
    
    private lazy var rulesLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "КартоКартошкаКартошкаКартошка КартошкаКартошкаКартошка КартошкаКартошкаКартош каКартошкашк аартоКартошкаКартошкаКартошкаКарто шкаКартошкаКартошкаКартошкаКартошкаКартошкаКартошкашкаартоКартошкаКартошкаКартошкаКартошкаКартошкаКартошкаКартошкаКартошкаКартошкаКартошкашкаартоКартошкаКартошкаКартошкаКартошкаКартошкаКартошкаКартошкаКартошкаКартошкаКартошкашка"
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        //label.sizeToFit()
        label.font = UIFont.systemFont(ofSize: 18)
        label.textColor = .black
        
        return label
    }()
    
    private lazy var backgroundImage: UIImageView = {
        let image = UIImageView(image: UIImage(named: Resources.Images.background))
        image.contentMode = .scaleAspectFill
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
    }
}
    // MARK: - Private Extension

    private extension RoolsViewContoller {
        
         func addSubviews() {
             view.addSubview(backgroundImage)
             backgroundImage.addSubview(rulesScrollView)
             rulesScrollView.addSubview(rulesLabel)
             
             setupConstraints()
        }
        
        private func setupConstraints() {
            NSLayoutConstraint.activate([
                backgroundImage.topAnchor.constraint(equalTo: view.topAnchor),
                backgroundImage.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                backgroundImage.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                backgroundImage.bottomAnchor.constraint(equalTo: view.bottomAnchor),

                rulesScrollView.topAnchor.constraint(equalTo: view.topAnchor, constant: 95),
                rulesScrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
                rulesScrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8),
                rulesScrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor,constant: -15),

                rulesLabel.topAnchor.constraint(equalTo: rulesScrollView.contentLayoutGuide.topAnchor, constant: 0),
                rulesLabel.leadingAnchor.constraint(equalTo: rulesScrollView.contentLayoutGuide.leadingAnchor, constant: 0),
                rulesLabel.trailingAnchor.constraint(equalTo: rulesScrollView.contentLayoutGuide.trailingAnchor)
                
                
            ])
        }
        
    }

