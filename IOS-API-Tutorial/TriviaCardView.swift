import SwiftUI


//This displays the question on the front and flips to reveal the answer.

struct TriviaCardView: View {
    
    @Binding var showAnswer: Bool
    let question: Question

    var body: some View {
        VStack {
            if showAnswer {
                Text(question.correctAnswer) // Display answer
                    .font(.largeTitle)
                    .foregroundColor(.green)
            } else {
                Text(question.question) // Display question
                    .font(.title2)
                    .multilineTextAlignment(.center)
            }
        }
        .frame(width: 300, height: 200)
        .padding()
        .background(showAnswer ? Color.yellow : Color.blue)
        .cornerRadius(15)
        .shadow(radius: 5)
        .onTapGesture {
            showAnswer.toggle() // Flip the card
        }
    }
}


