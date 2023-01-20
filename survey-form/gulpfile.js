import gulp from "gulp";
import { path } from "./gulp/config/path.js";
import { reset } from "./gulp/tasks/reset.js";
import { pugToHtml } from "./gulp/tasks/pugToHtml.js";
import { server } from "./gulp/tasks/server.js";
import { scss } from "./gulp/tasks/scss.js";
import { images } from "./gulp/tasks/images.js";
import { otfToTtf, ttfToWoff2, fontsStyle } from "./gulp/tasks/fonts.js";
import { svgSprive } from "./gulp/tasks/svgSprive.js";

const wathcer = () => {
  const watchScss = path.watch.scss;
  const watchImages = path.watch.imges;

  gulp.watch(`./src/**/*.pug`, pugToHtml);
  gulp.watch(watchScss, scss);
  gulp.watch(watchImages, images);
};

const fonts = gulp.series(otfToTtf, ttfToWoff2, fontsStyle);
const mainTasks = gulp.series(fonts, gulp.parallel(pugToHtml, scss, images));

export const dev = gulp.series(reset, mainTasks, gulp.parallel(wathcer, server));
export const build = gulp.series(reset, mainTasks);
export { svgSprive };

gulp.task('default', dev);
