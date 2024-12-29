import { Application } from "@hotwired/stimulus"

import ChartController from "./chart_controller"

const application = Application.start()

// Configure Stimulus development experience
application.debug = false
window.Stimulus   = application

application.register("chart", ChartController)

export { application }

