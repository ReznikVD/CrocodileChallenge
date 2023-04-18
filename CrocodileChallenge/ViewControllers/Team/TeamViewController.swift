//
//  TeamViewController.swift
//  CrocodileChallenge
//
//  Created by Владислав Резник on 17.04.2023.
//

import UIKit
struct CellModel {
  
    var image: UIImage
    
    static func makeModel() -> [CellModel] {[
        CellModel(image: UIImage(named: "cowboy")!),
        CellModel(image: UIImage(named: "burger")!),
    ]}
}

class TeamViewController: UIViewController {
  
    private var model: [CellModel] = CellModel.makeModel()
    lazy var indexPathSection = IndexPath()
    
    private var arrayOfImages = [UIImage(named: "cowboy"), UIImage(named: "burger")] // MOK
    
 

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
  
    private let backgroundImage: UIImageView = {
        let image = UIImageView(image: UIImage(named: "background"))
        image.contentMode = .scaleAspectFill
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private lazy var startButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 10
        button.setBackgroundImage(UIImage(named: "startButton"), for: .normal)
        return button
    }()
    
    func addviewLayout() {
        view.addSubview(backgroundImage)
        view.sendSubviewToBack(backgroundImage)
        view.addSubview(startButton)
        view.addSubview(tableView)
        
        
        NSLayoutConstraint.activate([
            backgroundImage.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundImage.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundImage.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundImage.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            startButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -62),
            startButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 14),
            startButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -14),
            
            tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 148),
            tableView.bottomAnchor.constraint(equalTo: startButton.topAnchor, constant: -10),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -12),
        ])
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addviewLayout()
       
        // Установка текста заголовка с большим шрифтом и стилем
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.largeTitleDisplayMode = .always
        navigationItem.title = "Кто играет?"
        navigationController?.navigationBar.largeTitleTextAttributes = [
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 34, weight: .bold),
            NSAttributedString.Key.foregroundColor: UIColor.black]
        
    }
}

extension TeamViewController:UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TeamTableViewCell.identifier, for: indexPath) as! TeamTableViewCell
        cell.setupCell(indexPath: indexPath) // здесь поменять входной параметр
        // cell.setupCell(image: arrayOfImages[indexPath.row])
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 96 + 28
    }
}

extension TeamViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return indexPath.section == 1
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
//        if indexPath.section == 1 && editingStyle == .delete {
//            postModel[indexPath.section].remove(at: indexPath.row)
//            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    



