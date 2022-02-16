//
//  StoryBrain.swift
//  Destini
//
//  Created by Vladimir Fibe on 15.02.2022.
//

import Foundation

struct StoryBrain {
  let stories = [
    // 0
    Story(title: "Your car has blown a tire on a winding road in the middle of nowhere with no cell phone reception. You decide to hitchhike. A rusty pickup truck rumbles to a stop next to you. A man with a wide-brimmed hat and soulless eyes opens the passenger door for you and says: \"Need a ride, boy?\"",
          choices: ["I'll hop in. Thanks for the help!": 2,
                    "Well, I don't have many options. Better ask him if he's a murderer.": 1]),
    // 1
    Story(title: "He nods slowly, unphased by the question.",
          choices: ["At least he's honest. I'll climb in.": 2,
                    "Wait, I know how to change a tire.": 3]),
    // 2
    Story(title: "As you begin to drive, the stranger starts talking about his relationship with his mother. He gets angrier and angrier by the minute. He asks you to open the glove box. Inside you find a bloody knife, two severed fingers, and a cassette tape of Elton John. He reaches for the glove box",
          choices: ["I love Elton John! Hand him the cassette tape.": 5,
                    "It’s him or me. Take the knife and stab him.": 4]),
    // 3
    Story(title: "What? Such a cop-out! Did you know accidental traffic accidents are the second leading cause of accidental death for most adult age groups?",
          choices: ["The End": 0]),
    // 4
    Story(title: "As you smash through the guardrail and careen towards the jagged rocks below you reflect on the dubious wisdom of stabbing someone while they are driving a car you are in.",
          choices: ["The End": 0]),
    // 5
    Story(title: "You bond with the murderer while crooning verses of \"Can you feel the love tonight\". He drops you off at the next town. Before you go he asks you if you know any good places to dump bodies. You reply: \"Try the pier.\"",
          choices: ["The End": 0]),
    // 6
    Story(title: "He nods slowly, unphased by the question.",
          choices: [:]),
    
  ]
  
  var page = 0
  
  mutating func nextPage(title: String) {
    page = stories[page].choices[title] ?? 0
  }
  
  func getChoices() -> [String] {
    var result = [String]()
    for (choice, _) in stories[page].choices {
      result.append(choice)
    }
    return result
  }
  
  func getTitle() -> String {
    stories[page].title
  }
  
}
