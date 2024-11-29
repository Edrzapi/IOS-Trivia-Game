import Foundation
import Combine

//This is an ObservableObject that handles state updates and API integration.

class TriviaViewModel: ObservableObject {
    @Published var currentQuestion: Question? // Holds the current question
    @Published var showAnswer: Bool = false // To toggle the card flip

    private let triviaService = TriviaService()
    private var cancellables = Set<AnyCancellable>()

    func loadNewQuestion() {
        triviaService.fetchQuestion()
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                if case .failure(let error) = completion {
                    print("Error: \(error)")
                }
            }, receiveValue: { [weak self] question in
                self?.currentQuestion = question
                self?.showAnswer = false // Reset answer visibility
            })
            .store(in: &cancellables)
    }
}
