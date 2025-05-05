import { defineConfig } from 'vite'

import ViteRails from "vite-plugin-rails";
import StimulusHMR from 'vite-plugin-stimulus-hmr'

export default defineConfig({
  plugins: [
    StimulusHMR(),
    ViteRails({ fullReload: false }),
  ],
  build: {
    sourcemap: true
  }
}) 