import UIKit
import SwiftUI
import AVFoundation

final class DistiniViewController: BaseController {
    var player: AVAudioPlayer!
    var storyBrain = StoryBrain() {
        didSet {
            updateUI()
        }
    }
    let destiniView = DestiniView()
    
    lazy var storyLabel = destiniView.storyLabel
    lazy var choiceButton = destiniView.choiceButtons
    
    let backgroundView = UIImageView(image: UIImage(named: "background")).then {
        $0.contentMode = .scaleToFill
    }
    
    func answerButtonPressed(_ index: Int) {
        print(index, String(format: "%02d", index))
        storyBrain.nextStory(index)
    }
    
    func updateUI() {
        let title = String(format: "%02d", storyBrain.currentIndex + 1)
        storyLabel.text = storyBrain.currentTitle
        destiniView.configure(with: storyBrain.currentChoices)
        playSound(title)
    }
    
    func playSound(_ title: String) {
        guard let url = Bundle.main.url(forResource: title, withExtension: "mp3") else { return }
        if let player = player { player.stop() }
        player = try! AVAudioPlayer(contentsOf: url)
        player.play()
    }
}

extension DistiniViewController {
    override func setupViews() {
        super.setupViews()
        view.addView(backgroundView)
        view.addView(destiniView)
    }
    
    override func layoutViews() {
        super.layoutViews()
        NSLayoutConstraint.activate([
            backgroundView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            destiniView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            destiniView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            destiniView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            destiniView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    override func configureAppearance() {
        super.configureAppearance()
        destiniView.answerButtonPressed = answerButtonPressed
        updateUI()
    }
}

struct SwiftUIController: UIViewControllerRepresentable {
  typealias UIViewControllerType = DistiniViewController
  
  func makeUIViewController(context: Context) -> UIViewControllerType {
    let viewController = UIViewControllerType()
    return viewController
  }
  
  func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
    
  }
}

struct SwiftUIController_Previews: PreviewProvider {
  static var previews: some View {
    SwiftUIController()
      .edgesIgnoringSafeArea(.all)
  }
}

