//
//  CategoryViewController.swift
//  CrocodileChallenge
//
//  Created by Владислав Резник on 17.04.2023.
//

import UIKit

class CategoryViewController: UIViewController {
    
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
    
    private lazy var startButton: CustomButton = {
        let button = CustomButton(title: "Начать игру", color: UIColor(named: Resources.Colors.green)!)
        button.addTarget(self, action: #selector(startButtonPressed), for: .touchUpInside)
        return button
    }()
    
    // MARK: - Properties
    
    private var categories = Category.getCategories()
    private lazy var currentCategory = categories[0]
    private var heightOfCell: CGFloat = 96
    private var spacingBetweenCells: CGFloat = 28
    private var manager = GameManager.shared
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigationBar()
        addViews()
    }
}

// MARK: - Private Extension

private extension CategoryViewController {
    
    func setupNavigationBar() {
        navigationItem.title = "Категории"
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
    
    @objc func startButtonPressed(_ sender: UIButton) {
        manager.setCategory(currentCategory)
        let vc = GameViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
}

// MARK: - UITableViewDataSource

extension CategoryViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CategoryTableViewCell.identifier, for: indexPath) as! CategoryTableViewCell
        cell.setupCell(categories[indexPath.row], check: currentCategory.title == categories[indexPath.row].title)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return heightOfCell + spacingBetweenCells
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // TODO: - change current category and reload table view
        currentCategory = categories[indexPath.row]
        tableView.reloadData()
    }
}

// MARK: - UITableViewDelegate

extension CategoryViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return indexPath.section == 1
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
    }
}
