import { Controller } from "@hotwired/stimulus"
// app/javascript/controllers/review_controller.js


export default class extends Controller {
  static targets = ["AddReview"];
  // connect(){

  //   console.log(this.AddReviewTarget);
  // }

  toggle() {
    this.AddReviewTarget.classList.toggle("d-none");
    // console.log(this.AddReviewTarget)
  }

  // // static targets = ["form"];

  // // toggleForm() {
  // //   const formElement = this.element.querySelector("#review-form");

  // //   if (formElement) {
  // //     formElement.classList.toggle("d-none"); }
  // }
};
