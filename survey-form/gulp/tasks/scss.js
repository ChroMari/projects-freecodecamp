import gulp from "gulp";
import { path } from "../config/path.js";
import browsersync from "browser-sync";
import dartSass from "sass";
import gulpSass from "gulp-sass";
import replace from "gulp-replace";
import rename from "gulp-rename";
import cleanCss from "gulp-clean-css";
import webpcss from "gulp-webpcss"; //npm i -D webp-converter@2.2.3
import autoprefixer from "gulp-autoprefixer";
import groupCssMediaQueries from "gulp-group-css-media-queries";
import ifPlugin from "gulp-if";

const sass = gulpSass(dartSass);

export const scss = () => {
  const srcFiles = path.src.scss;
  const buildFile = path.build.css;
  const isBuild = process.argv.includes('--build');

  return gulp
    .src(srcFiles, {sourcemaps: !isBuild})
    .pipe(replace(/@img\//g, '../img/'))
    .pipe(sass({
      outputStyle: 'expanded',
    }))
    .pipe(ifPlugin(isBuild, groupCssMediaQueries()))
    .pipe(ifPlugin(isBuild, 
      webpcss({
        webpClass: ".webp",
        noWebpClass: ".no-webp",
      }))
    )
    .pipe(ifPlugin(isBuild, 
      autoprefixer({
        grid: true,
        overriderBrowserslist: ["last 3 version"],
        cascade: true,
      }))
    )
    .pipe(gulp.dest(buildFile))
    .pipe(ifPlugin(isBuild, cleanCss()))
    .pipe(rename({
      extname: ".min.css"
    }))
    .pipe(gulp.dest(buildFile))
    .pipe(browsersync.stream());
};
