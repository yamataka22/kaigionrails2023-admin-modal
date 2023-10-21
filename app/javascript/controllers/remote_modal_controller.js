import { Controller } from "@hotwired/stimulus"
import { Modal } from "bootstrap"

// Connects to data-controller="remote-modal"
export default class extends Controller {

  connect() {
    //// ブラウザ上のURL書き換え
    // a) 現在(Modal起動前)のPathを取得しておく
    const currentPath = location.href
    // b) Modal起動時に表示したいPath
    const turboPath = this.element.dataset.turboPath

    if (turboPath.length > 0) {
      // 上記 b) をブラウザのURLにする
      history.pushState(null, null, turboPath)

      // Modalが閉じるイベントをフックする
      this.element.addEventListener('hidden.bs.modal', function (event) {
        // 上記 a) に戻す
        history.replaceState(null, null, currentPath)
      })
    }

    // モーダルの表示
    this.remoteModal = new Modal(this.element)
    this.remoteModal.show()
  }

  disconnect() {
    this.remoteModal.hide();
  }
}
