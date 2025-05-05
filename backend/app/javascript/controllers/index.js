// Import and register all your controllers from the importmap via controllers/**/*_controller
import { Application } from "@hotwired/stimulus"
import ChartController from "./chart_controller.js"

const application = Application.start()

application.register("chart", ChartController)

// Configure Stimulus development experience
application.debug = false
window.Stimulus   = application

export { application }
