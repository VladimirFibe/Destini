import Foundation

struct StoryBrain {
    let stories = Story.fetchStories()
  
    var currentIndex = 0
    
    var currentTitle: String {
        stories[currentIndex].title
    }
    
    var currentChoices: [String] {
        stories[currentIndex].choices.map { $0.text }
    }
    
    mutating func nextStory(_ index: Int) {
        let choices = stories[currentIndex].choices
        if index < choices.count {
            currentIndex = choices[index].index - 1
        } else {
            currentIndex = 0
        }
    }
}
