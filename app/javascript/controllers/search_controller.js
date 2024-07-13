import Rails from "@rails/ujs";
import {Controller} from "@hotwired/stimulus"
import {useDebounce} from 'stimulus-use'


export default class extends Controller {

    static debounces = ['search']

    connect() {
        useDebounce(this, {wait: 1000})
    }

    search(event) {
        Rails.fire(this.element, 'submit');
        event.preventDefault()
    }
}