import { Controller } from "@hotwired/stimulus"
import { Chart, registerables } from "chart.js"
import annotationPlugin from 'chartjs-plugin-annotation';

Chart.register(annotationPlugin, ...registerables);

export default class extends Controller {

  static targets = ["canvas"]
  static values = {
    measurements: Array,
    referenceRange: String,
    unit: String
  }

  connect() {
    const measurements = this.measurementsValue
    const referenceRange = this.referenceRangeValue

    console.log(measurements)

    const unit = this.unitValue

    const [minRange, maxRange] = this.parseReferenceRange(referenceRange)

    const config = {
      type: 'line',
      data: {
        labels: measurements.map(m => new Date(m.recorded_at).toLocaleDateString()),
        datasets: [
          {
            label: 'Measurements',
            data: measurements.map(m => parseFloat(m.value)),
            borderColor: 'rgb(13, 148, 136)',
            backgroundColor: 'rgba(13, 148, 136, 0.1)',
            tension: 0.1,
            pointRadius: 6,
            pointHoverRadius: 8
          }
        ]
      },
      options: {
        responsive: true,
        maintainAspectRatio: false,
        animation: false,
        plugins: {
          legend: {
            display: false
          },
          tooltip: {
            enabled: true,
            callbacks: {
              label: (context) => `${context.parsed.y} ${unit}`
            }
          },
          annotation: {
            annotations: {
              box1: {
                type: 'box',
                yMin: minRange,
                yMax: maxRange,
                backgroundColor: 'rgba(163, 230, 53, 0.1)',
                borderColor: 'rgba(163, 230, 53, 0.3)',
                borderWidth: 1,
                label: {
                  display: true,
                  content: 'Normal Range',
                  position: 'start'
                }
              }
            }
          }
        },
        scales: {
          y: {
            title: {
              display: true,
              text: unit
            },
            grid: {
              drawBorder: false
            }
          },
          x: {
            type: 'category',
            grid: {
              display: false
            }
          }
        }
      }
    }


   this.chart = new Chart(this.canvasTarget, config)
  }

  disconnect() {
    if (this.chart) {
      this.chart.destroy()
      this.chart = null
    }
  }

  parseReferenceRange(range) {
    if (range.includes('-')) {
      return range.split('-').map(v => parseFloat(v))
    } else if (range.includes('<')) {
      return [0, parseFloat(range.replace('<', ''))]
    } else if (range.includes('>')) {
      return [parseFloat(range.replace('>', '')), Infinity]
    }
    return [0, 0]
  }
}