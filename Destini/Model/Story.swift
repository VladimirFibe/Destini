import Foundation

struct Story: Decodable {
    let id: Int
    let title: String
    var choices: [Choice]
    
    static func fetchStories() -> [Story] {
        if let url = Bundle.main.url(forResource: "Story",
                                     withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let dataAsString = String(data: data, encoding: .utf8) ?? ""
                print("DEBUG: \(dataAsString)")
                let decoder = JSONDecoder()
                let stories = try decoder.decode([Story].self,
                                                   from: data)
                return stories
            } catch {
                print("error:\(error)")
            }
        }
        return [
            Story(id: 1, title: "1", choices: [Choice(text: "left", index: 1), Choice(text: "right", index: 1)])
          ]
    }
}

struct Choice: Decodable {
    let text: String
    let index: Int
}
