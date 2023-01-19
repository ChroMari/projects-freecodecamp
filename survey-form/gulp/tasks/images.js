import gulp from "gulp";
import { path } from "../config/path.js";
import browsersync from "browser-sync";
import webp from "gulp-webp";
import imagemin from "gulp-imagemin";
import newer from "gulp-newer";
import ifPlugin from "gulp-if";

export const images = () => {
  const srcFiles = path.src.images;
  const srcSvg = path.src.svg;
  const buildFile = path.build.images;
  const isBuild = process.argv.includes('--build');

  return gulp.src(srcFiles)
    .pipe(ifPlugin(isBuild, newer(buildFile)))
    .pipe(ifPlugin(isBuild, webp()))
    .pipe(ifPlugin(isBuild, gulp.dest(buildFile)))
    .pipe(ifPlugin(isBuild, gulp.src(srcFiles)))
    .pipe(ifPlugin(isBuild, newer(buildFile)))
    .pipe(ifPlugin(isBuild, 
      imagemin({
        progressive: true,
        svgoPlugins: [{ removeViewBox: false}],
        interlaced: true,
        optimizationLevel: 3,
      }))
    )
    .pipe(gulp.dest(buildFile))
    .pipe(gulp.src(srcSvg))
    .pipe(gulp.dest(buildFile))
    .pipe(browsersync.stream());
};
