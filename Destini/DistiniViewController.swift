//
//  DistiniViewController.swift
//  Destini
//
//  Created by Vladimir Fibe on 15.02.2022.
//

import UIKit

class DistiniViewController: UIViewController {

  var storyBrain = StoryBrain()
  let backgroundView = UIImageView(image: UIImage(named: "background"))
  let storyLabel: UILabel = {
    let label = UILabel()
    label.text = "Story Text"
    label.font = .systemFont(ofSize: 25)
    label.textColor = .white
    label.numberOfLines = 0
    return label
  }()
  let choice1Button: UIButton = {
    let button = UIButton(type: .system)
    button.setTitle("Choice 1", for: .normal)
    button.titleLabel?.font = .systemFont(ofSize: 23)
    button.layer.cornerRadius = 16
    button.backgroundColor = .red
    button.titleLabel?.lineBreakMode = .byWordWrapping
    button.titleLabel?.textAlignment = .center
    button.translatesAutoresizingMaskIntoConstraints = false
    button.heightAnchor.constraint(equalToConstant: 100).isActive = true
    button.addTarget(self, action: #selector(choiceMade), for: .touchUpInside)
    return button
  }()
  let choice2Button: UIButton = {
    let button = UIButton(type: .system)
    button.setTitle("Choice 2", for: .normal)
    button.titleLabel?.font = .systemFont(ofSize: 23)
    button.layer.cornerRadius = 16
    button.backgroundColor = .purple
    button.titleLabel?.lineBreakMode = .byWordWrapping
    button.titleLabel?.textAlignment = .center
    button.translatesAutoresizingMaskIntoConstraints = false
    button.heightAnchor.constraint(equalToConstant: 100).isActive = true
    button.addTarget(self, action: #selector(choiceMade), for: .touchUpInside)
    return button
  }()
  lazy var buttons = [choice1Button, choice2Button]
  func setupUI() {
    view.addSubview(backgroundView)
    backgroundView.contentMode = .scaleAspectFill
    backgroundView.translatesAutoresizingMaskIntoConstraints = false
    backgroundView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
    backgroundView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    backgroundView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
    backgroundView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    let stack = UIStackView(arrangedSubviews: [storyLabel, choice1Button, choice2Button])
    stack.axis = .vertical
    stack.distribution = .fillProportionally
    stack.alignment = .fill
    stack.spacing = 20
    view.addSubview(stack)
    let margins = view.layoutMarginsGuide
    stack.translatesAutoresizingMaskIntoConstraints = false
    stack.topAnchor.constraint(equalTo: margins.topAnchor).isActive = true
    stack.bottomAnchor.constraint(equalTo: margins.bottomAnchor).isActive = true
    stack.leadingAnchor.constraint(equalTo: margins.leadingAnchor).isActive = true
    stack.trailingAnchor.constraint(equalTo: margins.trailingAnchor).isActive = true
  }
  override func viewDidLoad() {
    super.viewDidLoad()
    setupUI()
    updateUI()

  }
  @objc func choiceMade(_ sender: UIButton) {
    if let title = sender.currentTitle {
      storyBrain.nextPage(title: title)
    }
    updateUI()
  }
  func updateUI() {
    storyLabel.text = storyBrain.getTitle()
    let choices = storyBrain.getChoices()
    for i in 0..<buttons.count {
      if i < choices.count {
        buttons[i].setTitle(choices[i], for: .normal)
        buttons[i].isHidden = false
      } else {
        buttons[i].setTitle("", for: .normal)
        buttons[i].isHidden = true
      }
    }
  }
}
