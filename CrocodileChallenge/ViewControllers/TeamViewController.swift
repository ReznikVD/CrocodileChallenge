//
//  TeamViewController.swift
//  CrocodileChallenge
//
//  Created by Владислав Резник on 17.04.2023.
//

import UIKit

class TeamViewController: UIViewController {
    
    // MARK: - Subviews
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(TeamTableViewCell.self, forCellReuseIdentifier: TeamTableViewCell.identifier)
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
    
    private lazy var startButton: CustomButton = {
        let button = CustomButton(title: "Игроки готовы", color: UIColor(named: Resources.Colors.green)!)
        button.addTarget(self, action: #selector(startButtonPressed), for: .touchUpInside)
        return button
    }()
    
    @objc private func startButtonPressed() {
        navigationController?.pushViewController(CategoryViewController(), animated: true)
    }
    
    // MARK: - Properties
    
    private var arrayOfImages = [Resources.Images.cowboy, Resources.Images.burger]
    private var arrayOfCellLabelTexts = ["Ковбои", "Стройняшки"]
    private var heightOfCell: CGFloat = 96
    private var spacingBetweenCells: CGFloat = 28
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigationBar()
        addViews()
    }
}

// MARK: - Private Extension

private extension TeamViewController {
    
    func setupNavigationBar() {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.largeTitleDisplayMode = .always
        navigationItem.title = "Кто играет?"
        navigationController?.navigationBar.largeTitleTextAttributes = [
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 34, weight: .bold),
            NSAttributedString.Key.foregroundColor: UIColor.black
        ]
    }
    
    func addViews() {
        view.addSubview(backgroundImage)
        view.sendSubviewToBack(backgroundImage)
        view.addSubview(startButton)
        view.addSubview(tableView)
        
        setupConstraints()
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            backgroundImage.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundImage.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundImage.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundImage.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            startButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -62),
            startButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 14),
            startButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -14),
            startButton.heightAnchor.constraint(equalToConstant: 63),
            
            tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 148),
            tableView.bottomAnchor.constraint(equalTo: startButton.topAnchor, constant: -10),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -12),
        ])
    }
}

// MARK: - UITableViewDataSource

extension TeamViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayOfImages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TeamTableViewCell.identifier, for: indexPath) as! TeamTableViewCell
        cell.setupCell(with: UIImage(named: arrayOfImages[indexPath.row])!)
        cell.cellLabel.text = arrayOfCellLabelTexts[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return heightOfCell + spacingBetweenCells
    }
}

// MARK: - UITableViewDelegate

extension TeamViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return indexPath.section == 1
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
    }
}
