import { Controller } from "@hotwired/stimulus"
import { Modal } from "bootstrap"

// Connects to data-controller="remote-modal"
export default class extends Controller {

  connect() {
    // モーダルの表示
    this.remoteModal = new Modal(this.element)
    this.remoteModal.show()

    // ブラウザ上のURL書き換え
    const turboPath = this.element.dataset.turboPath
    if (turboPath.length > 0) {
      const prevPath = location.href
      this.element.addEventListener('hidden.bs.modal', function (event) {
        history.replaceState(null, null, prevPath)
      })
      history.pushState(null, null, this.element.dataset.turboPath)
    }
  }

  disconnect() {
    this.remoteModal.hide();
  }
}
