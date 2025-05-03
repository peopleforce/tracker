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
      path.join(process.cwd(), "app/javascript/application.js"),
      path.join(process.cwd(), "app/assets/stylesheets/application.tailwind.css")
    ],
    outdir: path.join(process.cwd(), "app/assets/builds"),
    absWorkingDir: process.cwd(),
    bundle: true,
    plugins: [
      rails(),
      {
        name: 'postcss',
        setup(build) {
          build.onLoad({ filter: /\.css$/ }, async (args) => {
            const css = await readFile(args.path, 'utf8')
            const result = await postcss([
              tailwindcss,
              autoprefixer
            ]).process(css, {
              from: args.path,
            })
            return {
              contents: result.css,
              loader: 'css',
            }
          })
        },
      },
    ],
    resolveExtensions: ['.js', '.css'],
    nodePaths: ['node_modules']
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
