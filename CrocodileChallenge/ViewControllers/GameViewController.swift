//
//  GameViewController.swift
//  CrocodileChallenge
//
//  Created by Владислав Резник on 17.04.2023.
//

import UIKit

class GameViewController: UIViewController {

    struct Spec {
        static var
    }

    private lazy var backgroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: Resources.Images.background)
        imageView.contentMode = .scaleAspectFill
        imageView.layer.masksToBounds = true
        return imageView
    }()

    private lazy var crocodileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: Resources.Images.littleCrocodile)
        imageView.contentMode = .scaleAspectFill
        imageView.layer.masksToBounds = true
        return imageView
    }()

    private lazy var timerLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "00:00"
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 48)
        label.textColor = .black
        label.textAlignment = .center
        return label
    }()

    private lazy var wordLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Картошка"
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 48)
        label.textColor = .black
        label.textAlignment = .center
        return label
    }()

    private lazy var taskLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Объясни с помощью жестов"
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 20)
        label.textColor = .black
        label.textAlignment = .center
        return label
    }()

    private lazy var buttonsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 12
        return stackView
    }()


    private lazy var rightButton: CustomButton = {
        let button = CustomButton(title: "Правильно", color: UIColor(named: Resources.Colors.green)!)
        return button
    }()

    private lazy var brokeRulesButton: CustomButton = {
        let button = CustomButton(title: "Нарушил правила", color: UIColor(named: Resources.Colors.red)!)
        return button
    }()


    private lazy var cancelButton: CustomButton = {
        let button = CustomButton(title: "Сбросить", color: UIColor(named: Resources.Colors.gray)!)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
        setupConstraints()
    }
}

extension GameViewController {
    private func addSubviews() {
        view.addSubview(backgroundImageView)
        backgroundImageView.addSubview(crocodileImageView)
        backgroundImageView.addSubview(timerLabel)
        backgroundImageView.addSubview(wordLabel)
        backgroundImageView.addSubview(taskLabel)
        backgroundImageView.addSubview(buttonsStackView)
        buttonsStackView.addArrangedSubview(rightButton)
        buttonsStackView.addArrangedSubview(brokeRulesButton)
        buttonsStackView.addArrangedSubview(cancelButton)
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),

            crocodileImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 36),
            crocodileImageView.heightAnchor.constraint(equalToConstant: 140),
            crocodileImageView.widthAnchor.constraint(equalToConstant: 140),
            crocodileImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),

            timerLabel.topAnchor.constraint(equalTo: crocodileImageView.bottomAnchor, constant: 54),
            timerLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            timerLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),

            wordLabel.topAnchor.constraint(equalTo: timerLabel.bottomAnchor, constant: 94),
            wordLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            wordLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),

            taskLabel.topAnchor.constraint(equalTo: wordLabel.bottomAnchor, constant: 10),
            taskLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            taskLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),

            buttonsStackView.topAnchor.constraint(lessThanOrEqualTo: taskLabel.bottomAnchor, constant: 100),
            buttonsStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12),
            buttonsStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -12),
            buttonsStackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -48),

            rightButton.heightAnchor.constraint(equalToConstant: 60),
            brokeRulesButton.heightAnchor.constraint(equalToConstant: 60),
            cancelButton.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
}
