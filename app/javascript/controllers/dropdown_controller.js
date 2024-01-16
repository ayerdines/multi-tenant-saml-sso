import { Controller } from "@hotwired/stimulus"
import { useClickOutside, useTransition } from "stimulus-use";

export default class extends Controller {
  static targets = ["select"]

  connect() {
    console.log(`dropdown controller connected`)
    useTransition(this, {
      element: this.selectTarget
    });
    useClickOutside(this);
  }

  clickOutside() {
    this.leave();
  }

  toggle() {
    this.toggleTransition();
  }
}
