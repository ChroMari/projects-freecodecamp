import gulp from "gulp";
import pug from "gulp-pug";
import webpHtmlNosvg from "gulp-webp-html-nosvg";
import versionNumber from "gulp-version-number";
import rename from "gulp-rename";
import browsersync from "browser-sync";
import ifPlugin from "gulp-if";

export const pugToHtml = () => {
  const STARTFiles = `./src/pages/**/*.pug`;
  const FINISHFiles = `./dist/`;
  const isBuild = process.argv.includes(`--build`);

  return gulp
    .src(STARTFiles)
    .pipe(pug({
      pretty: true,
      verbose: true,
    }))
    .pipe(ifPlugin(isBuild, webpHtmlNosvg()))
    .pipe(
      ifPlugin(isBuild,  versionNumber({
        'value': '%DT%',
        'append': {
          'key': '_v',
          'cover': 0,
          'to': ['css', 'js'],
        },
        'output': {
          'file': 'gulp/version.json',
        },
      }))
     )
    .pipe(rename({dirname: ''}))
    .pipe(gulp.dest(FINISHFiles))
    .pipe(browsersync.stream());
};
