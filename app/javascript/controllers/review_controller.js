import { Controller } from "@hotwired/stimulus"
// app/javascript/controllers/review_controller.js


export default class extends Controller {
  static target = ["AddReviewTarget"];
  connect() {
    console.log("salut")
    console.log(this.AddReviewTarget);
  }
  // // static targets = ["form"];

  // // toggleForm() {
  // //   const formElement = this.element.querySelector("#review-form");

  // //   if (formElement) {
  // //     formElement.classList.toggle("d-none"); }
  // }
};
