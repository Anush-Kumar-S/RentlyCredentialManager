import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  // connect() {
  //   this.element.textContent = "Hello World!"
  // } "credentials/16/fetch_password.json"

  async copyValue() {
    const response = await fetch(`/credentials/${this.data.get('credId')}/fetch_password.json`);
    const resValue = await response.json();
    const valueToCopy = resValue.password;

    await navigator.clipboard.writeText(valueToCopy);
  }
}
