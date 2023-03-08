// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import "popper"
import "bootstrap"

document.addEventListener('DOMContentLoaded', startFrontController)
document.addEventListener('turbo:render', startFrontController)

function startFrontController(event) {
    document.removeEventListener('DOMContentLoaded', startFrontController)

    let delete_buttons = document.getElementsByClassName("js-delete")
    Array.from(delete_buttons).forEach(function(element) {
        element.addEventListener("click", setConfirmModal)
    });

}
let setConfirmModal = (e) => {
    let el = e.currentTarget
    let url = el.dataset.url
    let method = el.dataset.method
    let confirm = el.dataset.confirm

    document.querySelector("#confirm_text").innerHTML = confirm
    let link = document.querySelector("#confirm_btn")
    link.setAttribute("href", url)
    link.setAttribute("data-turbo-method", method)
}
