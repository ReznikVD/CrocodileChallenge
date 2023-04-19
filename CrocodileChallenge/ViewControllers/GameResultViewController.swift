//
//  GameResultViewController.swift
//  CrocodileChallenge
//
//  Created by Vasili Staratsitarau on 19.04.2023.
//

import UIKit

class GameResultViewController: UIViewController {
    
    // MARK: - Subviews
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(CategoryTableViewCell.self, forCellReuseIdentifier: CategoryTableViewCell.identifier)
        tableView.backgroundColor = .clear
        tableView.separatorStyle = .none
        return tableView
    }()
    
    private lazy var backgroundImage: UIImageView = {
        let image = UIImageView(image: UIImage(named: Resources.Images.background))
        image.contentMode = .scaleAspectFill
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private lazy var restartButton: CustomButton = {
        let button = CustomButton(title: "Начать сначала", color: UIColor(named: Resources.Colors.green)!)
        return button
    }()
    
    // MARK: - Properties
    
    private var arrayOfImages = [Resources.Images.frog, Resources.Images.burger, Resources.Images.cowboy]
    private var arrayOfCellLabelTexts = ["Животные", "Еда", "Личности", "Хобби"]
    private var heightOfCell: CGFloat = 96
    private var spacingBetweenCells: CGFloat = 28
    private var titleText = "Результаты"
    
    // MARK: - Lifecycle
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.centerTitle()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigationBar()
        addViews()
    }
    
}

// MARK: - Private Extension

private extension GameResultViewController {
    
    func setupNavigationBar() {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.largeTitleDisplayMode = .always
        navigationItem.title = titleText
        navigationController?.navigationBar.largeTitleTextAttributes = [
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 34, weight: .bold),
            NSAttributedString.Key.foregroundColor: UIColor.black
        ]
    }
    
    func addViews() {
        view.addSubview(backgroundImage)
        view.sendSubviewToBack(backgroundImage)
        view.addSubview(restartButton)
        view.addSubview(tableView)
        
        setupConstraints()
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            backgroundImage.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundImage.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundImage.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundImage.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            restartButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -62),
            restartButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 14),
            restartButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -14),
            restartButton.heightAnchor.constraint(equalToConstant: 63),
            
            tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 148),
            tableView.bottomAnchor.constraint(equalTo: restartButton.topAnchor, constant: -10),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -12),
        ])
    }
}

// MARK: - UITableViewDataSource

extension GameResultViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayOfImages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CategoryTableViewCell.identifier, for: indexPath) as! CategoryTableViewCell
        cell.setupCell(image: UIImage(named: arrayOfImages[indexPath.row])!, color: .white)
        cell.cellLabel.text = arrayOfCellLabelTexts[indexPath.row]
        cell.cellLabel.textColor = .black
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return heightOfCell + spacingBetweenCells
        
    }
}

// MARK: - UITableViewDelegate

extension GameResultViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return indexPath.section == 1
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
    }
}

extension UIViewController{
    func centerTitle(){
        for navItem in(self.navigationController?.navigationBar.subviews)! {
             for itemSubView in navItem.subviews {
                 if let resultLabel = itemSubView as? UILabel {
                    resultLabel.center = CGPoint(x: navItem.bounds.width/2, y: navItem.bounds.height/2)
                    return;
                 }
             }
        }
    }
}
