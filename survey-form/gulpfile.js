import gulp from "gulp";
import { path } from "./gulp/config/path.js";
import { reset } from "./gulp/tasks/reset.js";
import { pugToHtml } from "./gulp/tasks/pugToHtml.js";
import { server } from "./gulp/tasks/server.js";
import { scss } from "./gulp/tasks/scss.js";
import { js } from "./gulp/tasks/js.js";
import { images } from "./gulp/tasks/images.js";
import { otfToTtf, ttfToWoff2, fontsStyle } from "./gulp/tasks/fonts.js";
import { svgSprive } from "./gulp/tasks/svgSprive.js";

import eslint from 'gulp-eslint';

const wathcer = () => {
  const watchScss = path.watch.scss;
  const watchJs = path.watch.js;
  const watchImages = path.watch.imges;

  gulp.watch(`./src/**/*.pug`, pugToHtml);
  gulp.watch(watchScss, scss);
  gulp.watch(watchJs, js);
  gulp.watch(watchImages, images);
};

const paths = {
  js: './src/components/**/*.js',
};

// function testJsLint() {
//   return gulp.src(paths.js).
//       pipe(eslint()).
//       pipe(eslint.format()).
//       pipe(eslint.failAfterError());
// }

// const tests = gulp.parallel(testJsLint);
// exports.tests = tests;

// export default tests;

const fonts = gulp.series(otfToTtf, ttfToWoff2, fontsStyle);
const mainTasks = gulp.series(fonts, gulp.parallel(pugToHtml, scss, js, images));

export const dev = gulp.series(reset, mainTasks, gulp.parallel(wathcer, server));
export const build = gulp.series(reset, mainTasks);
export { svgSprive };

gulp.task('default', dev);
