import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["form", "type", "startDate", "endDate"]

  connect() {
    this.updateEndDate()
  }

  submit(event) {
    event.preventDefault()
    this.updateEndDate()
    this.formTarget.submit()
  }

  updateEndDate() {
    const timetableType = this.typeTarget.value
    const startDate = new Date(this.startDateTarget.value)
    let endDate

    if (timetableType === 'monthly') {
      endDate = new Date(startDate.getFullYear(), startDate.getMonth() + 1, 0)
    } else if (timetableType === 'weekly') {
      endDate = new Date(startDate.getTime() + 6 * 24 * 60 * 60 * 1000)
    } else {
      return // Don't update end date for custom type
    }

    this.endDateTarget.value = endDate.toISOString().split('T')[0]
  }
}
