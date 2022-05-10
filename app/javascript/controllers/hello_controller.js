import {Controller} from "@hotwired/stimulus"

export default class extends Controller {
    static targets = ["question", "answer"]

    connect() {
        // this.element.textContent = "Hello World!"
    }

    greet() {
        // console.log("Hello, Stimulus!", this.element)
        const questionId = event.target.dataset.questionId
        const questionState = event.target.dataset.state

        if (questionState == "closed") {
            this.openQuestion(questionId);
        } else {
            this.closeQuestion(questionId);
        }
    }

    closeQuestion(questionId) {
        event.target.dataset.state = "closed"
        event.target.textContent = "Show Responses"
        this.questionTargets.forEach((e) => {
            if (e.dataset.helloQuestionId.toString() == questionId) {
                e.classList.remove('bg-light')
                e.classList.remove('open')
            }
        })
        this.answerTargets.forEach((e) => {
            if (e.dataset.helloQuestionId.toString() == questionId) {
                e.hidden = true;
                e.classList.remove('bg-light')
                e.classList.remove('open')
            }
        })
    }

    openQuestion(questionId) {
        event.target.dataset.state = "open"
        event.target.textContent = "Hide Responses"

        this.questionTargets.forEach((e) => {
            if (e.dataset.helloQuestionId.toString() == questionId) {
                e.classList.add('open')
                e.classList.add('bg-light')
            }
        })
        this.answerTargets.forEach((e) => {
            if (e.dataset.helloQuestionId.toString() == questionId) {
                e.classList.add('open')
                e.removeAttribute("hidden");
                e.classList.add('bg-light')
            }
        })
    }
}

console.log('Stimulus hello controller loaded')
