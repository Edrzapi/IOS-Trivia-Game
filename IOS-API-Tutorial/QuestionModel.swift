

import Foundation

//This struct represents the trivia question and its answer.

//Purpose: The Identifiable protocol is used in Swift to uniquely identify objects. It's especially useful in SwiftUI for rendering lists or collections efficiently.

struct Question: Identifiable, Decodable {
// The Decodable protocol allows a type to decode itself from external representations, such as JSON data. It works as part of Swift's Codable system, which combines Encodable and Decodable.

    
    
    let id = UUID()
    let question: String
    let correctAnswer: String

    enum CodingKeys: String, CodingKey {
        case question
        case correctAnswer = "correct_answer"
    }
}
