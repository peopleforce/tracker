import path from "path"
import rails from "esbuild-rails"
import esbuild from "esbuild"
import postcss from 'postcss'
import tailwindcss from '@tailwindcss/postcss7-compat'
import autoprefixer from 'autoprefixer'
import { readFile } from 'fs/promises'

const isDevelopment = process.env.NODE_ENV === 'development'

esbuild
  .context({
    entryPoints: [
      "application.js"
    ],
    outdir: path.join(process.cwd(), "app/assets/builds"),
    absWorkingDir: process.cwd(),
    bundle: true,
    minify: process.env.RAILS_ENV == "production",
    plugins: [
      rails()
    ],
    resolveExtensions: ['.js', '.css']
  })
  .then((r) => {
    console.log('✨ Build succeeded.');

    if (isDevelopment) {
      r.watch();
      console.log('watching...');
    } else {
      r.dispose();
    }
  })
  .catch(() => process.exit(1));
