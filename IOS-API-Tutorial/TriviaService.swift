import Foundation
import Combine


//This handles fetching a trivia question from the OpenTDB API.

class TriviaService {
    func fetchQuestion() -> AnyPublisher<Question, Error> {
        let url = URL(string: "https://opentdb.com/api.php?amount=1&category=20&type=boolean")!

        return URLSession.shared.dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: TriviaResponse.self, decoder: JSONDecoder())
            .map { $0.results.first! }
            .eraseToAnyPublisher()
    }
}

// Response format
struct TriviaResponse: Decodable {
    let results: [Question]
}
