//
//  CorrectViewController.swift
//  CrocodileChallenge
//
//  Created by Владислав Резник on 17.04.2023.
//

import UIKit

class CorrectViewController: UIViewController {
	
	private lazy var backgroundImage: UIImageView = {
		let imageView = UIImageView()
		imageView.image = UIImage(named: Resources.Images.background)
		imageView.translatesAutoresizingMaskIntoConstraints = false
		imageView.contentMode = .scaleAspectFill
		return imageView
	}()

	private lazy var starStackView: UIStackView = {
		let stackView = UIStackView()
		stackView.axis = .vertical
		stackView.alignment = .center
		stackView.distribution = .fillProportionally
		stackView.spacing = 0
		return stackView
	}()

	private lazy var pointsStackView: UIStackView = {
		let stackView = UIStackView()
		stackView.axis = .vertical
		stackView.alignment = .fill
		stackView.distribution = .fill
		stackView.spacing = 0
		return stackView
	}()

	private lazy var passButton: CustomButton = {
		let button = CustomButton(title: "Передать ход", color: UIColor(named: Resources.Colors.green)!)
		return button
	}()
	
	private lazy var teamView: TeamView = {
		let view = TeamView()
		return view
	}()
	
	private lazy var resultView: ResultView = {
		let view = ResultView()
		return view
	}()
	
    override func viewDidLoad() {
        super.viewDidLoad()
		addSubviews()
		setupConstraints()
	
    }
}

extension CorrectViewController {
	private func addSubviews() {
		view.addSubview(backgroundImage)
		
		view.addSubview(teamView)
		view.addSubview(resultView)
		view.addSubview(passButton)
		
	}
	
	private func setupConstraints() {
		NSLayoutConstraint.activate([
			backgroundImage.topAnchor.constraint(equalTo: view.topAnchor),
			backgroundImage.bottomAnchor.constraint(equalTo: view.bottomAnchor),
			backgroundImage.leadingAnchor.constraint(equalTo: view.leadingAnchor),
			backgroundImage.trailingAnchor.constraint(equalTo: view.trailingAnchor),

			teamView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12),
			teamView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -12),
			teamView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40),
			teamView.heightAnchor.constraint(equalToConstant: 96),

			resultView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12),
			resultView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -12),
			resultView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
			resultView.heightAnchor.constraint(equalToConstant: 301),

			passButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12),
			passButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -12),
			passButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -12),
			passButton.heightAnchor.constraint(equalToConstant: 60),
		])
	}
}
