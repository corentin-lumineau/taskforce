const RESET_TIMEOUT_MILLIS = 3000;
const CONFIRMATION_MESSAGE = '<strong>Are you sure?</strong>';

import { Controller } from "stimulus";

export default class extends Controller {
  static targets = ['input'];

  connect() {
    this.tasks= false;
  }

 

  delete(event) {
    if(this.tasks) {
      this.inputTarget.addEventListener('ajax:success', this.handleSuccess.bind(this))
      this.inputTarget.addEventListener('ajax:error', this.handleError.bind(this))
    } else {
      console.log(this.inputTarget);
      this.oldMessage = this.inputTarget.innerHTML;
      this.inputTarget.innerHTML = CONFIRMATION_MESSAGE;
      this.tasks = true;
      this.timeout = setTimeout(() => {
        this.resetState();
    }, RESET_TIMEOUT_MILLIS);
    event.preventDefault();
    return false;
  }
}

  handleSuccess(event) {
    clearTimeout(this.timeout);
    this.element.parentNode.removeChild(this.element);
  }

  handleError(event) {
    clearTimeout(this.timeout);
    this.resetState();
    this.element.style = '';
  }

  resetState() {
    if (this.tasks) {
      this.inputTarget.removeEventListener('ajax:success', this.handleSuccess.bind(this))
      this.inputTarget.removeEventListener('ajax:error', this.handleError.bind(this))
      this.inputTarget.innerHTML = this.oldMessage;
      this.tasks = false;
    }
  }
}
    
    

    // fetch('/tasks', { 
    //   method: 'DELETE',
    //   data: task,
    //   headers: { accept: "application/json" },
    // })

    // .then(response => response.json())
    // .then((data) => {
    //   console.log(data);
    // });