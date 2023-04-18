//
//  TeamCollectionViewCell.swift
//  CrocodileChallenge
//
//  Created by Marat Guseynov on 18.04.2023.
//

import UIKit

class TeamTableViewCell: UITableViewCell {
    
    private var model: [CellModel] = CellModel.makeModel()
    lazy var indexPathSection = IndexPath()
    
    private lazy var containerView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 10
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var avatarIcon: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    func setupCell(indexPath: IndexPath) {
        indexPathSection = indexPath
        avatarIcon.image = model[indexPath.row].image
        layout()
        backgroundColor = .clear
    }
    
    private func layout() {
        addSubview(containerView)
        containerView.addSubview(avatarIcon)
        
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: self.topAnchor, constant: 28),
            containerView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            containerView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            
            avatarIcon.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 20),
            avatarIcon.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 17),
            avatarIcon.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -20),
            avatarIcon.widthAnchor.constraint(equalToConstant: 56)
        ])
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super .init(style: style, reuseIdentifier: reuseIdentifier)
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension UIView {
    static var identifier : String {
        String(describing: self)
    }
}

