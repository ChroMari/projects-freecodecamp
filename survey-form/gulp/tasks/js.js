import gulp from "gulp";
import { path } from "../config/path.js";
import browsersync from "browser-sync";
import webpack from "webpack-stream";

export const js = () => {
  const srcFiles = path.src.js;
  const buildFile = path.build.js;
  const isBuild = process.argv.includes('--build');

  return gulp.src(srcFiles, { sourcemaps: !isBuild })
    .pipe(webpack({
      mode: isBuild ? 'production' : 'development',
      output: {
        filename: 'app.min.js',
      }
    }))
    .pipe(gulp.dest(buildFile))
    .pipe(browsersync.stream());
};
