//
//  DistiniViewController.swift
//  Destini
//
//  Created by Vladimir Fibe on 15.02.2022.
//

import UIKit

class DistiniViewController: UIViewController {
  var storyBrain = StoryBrain()
  let backgroundView: UIImageView = {
    $0.contentMode = .scaleAspectFill
    $0.translatesAutoresizingMaskIntoConstraints = false
    return $0
  }(UIImageView(image: UIImage(named: "background")))
  
  let storyLabel: UILabel = {
    $0.text = "Story Text"
    $0.font = .systemFont(ofSize: 25)
    $0.adjustsFontSizeToFitWidth = true
    $0.numberOfLines = 0
    $0.translatesAutoresizingMaskIntoConstraints = false
    return $0
  }(UILabel())
  
  let buttons = [UIButton(type: .system), UIButton(type: .system)]
  func setupUI() {
    buttons.forEach {
      $0.titleLabel?.font = .systemFont(ofSize: 23)
      $0.titleLabel?.adjustsFontSizeToFitWidth = true
      $0.layer.cornerRadius = 16
      $0.backgroundColor = .purple
      $0.titleLabel?.lineBreakMode = .byWordWrapping
      $0.titleLabel?.textAlignment = .center
      $0.translatesAutoresizingMaskIntoConstraints = false
      $0.addTarget(nil, action: #selector(choiceMade), for: .touchUpInside)
    }
    buttons[0].backgroundColor = .red

    let margins = view.layoutMarginsGuide
    let stack = UIStackView(arrangedSubviews: buttons)
    stack.axis = .vertical
    stack.distribution = .fillEqually
    stack.spacing = 10
    stack.translatesAutoresizingMaskIntoConstraints = false
    
    view.addSubview(backgroundView)
    view.addSubview(stack)
    view.addSubview(storyLabel)
    
    NSLayoutConstraint.activate([
      backgroundView.topAnchor.constraint(equalTo: view.topAnchor),
      backgroundView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
      backgroundView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: -1),
      backgroundView.trailingAnchor.constraint(equalTo: view.trailingAnchor),

      stack.bottomAnchor.constraint(equalTo: margins.bottomAnchor, constant: -20),
      stack.leadingAnchor.constraint(equalTo: margins.leadingAnchor),
      stack.trailingAnchor.constraint(equalTo: margins.trailingAnchor),
      stack.heightAnchor.constraint(equalToConstant: 190),
      
      storyLabel.topAnchor.constraint(equalTo: margins.topAnchor),
      storyLabel.leadingAnchor.constraint(equalTo: margins.leadingAnchor),
      storyLabel.trailingAnchor.constraint(equalTo: margins.trailingAnchor),
      storyLabel.bottomAnchor.constraint(equalTo: stack.topAnchor, constant: -20)
    ])
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
