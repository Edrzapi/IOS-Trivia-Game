import SwiftUI
// Main screen

struct TriviaGameView: View {
    @StateObject private var viewModel = TriviaViewModel()

    var body: some View {
        VStack {
            if let question = viewModel.currentQuestion {
                TriviaCardView(showAnswer: $viewModel.showAnswer, question: question)
                    .padding()
            } else {
                ProgressView()
                    .onAppear {
                        viewModel.loadNewQuestion()
                    }
            }

            Button("Next Question") {
                viewModel.loadNewQuestion()
            }
            .padding()
            .background(Color.green)
            .foregroundColor(.white)
            .cornerRadius(10)
        }
        .navigationTitle("Trivia Quiz")
    }
}

#Preview {
    TriviaGameView()
}
