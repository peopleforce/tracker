import path from "path"
import rails from "esbuild-rails"
import esbuild from "esbuild"

esbuild
  .context({
    entryPoints: ["application.js"],
    outdir: path.join(process.cwd(), "app/assets/builds"),
    absWorkingDir: path.join(process.cwd(), "app/javascript"),
    bundle: true,
    plugins: [rails()],
    resolveExtensions: ['.js'],
    nodePaths: ['node_modules']
  })
  .then((r) => {
    console.log('✨ Build succeeded.');

    r.watch();
    console.log('watching...');
  })
  .catch(() => process.exit(1));
