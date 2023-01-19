import gulp from "gulp";
import { path } from "../config/path.js";
import svgSprite from "gulp-svg-sprite";

export const svgSprive = () => {
  const srcFiles = path.src.svgicons;
  const buildFile = path.build.images;

  return gulp
    .src(`${srcFiles}`, {})
    .pipe(svgSprite({
      mode: {
        stack: {
          sprite: `../icons/icons.svg`,
          example: true,
        }
      }, })
    )
    .pipe(gulp.dest(`${buildFile}`));
};
