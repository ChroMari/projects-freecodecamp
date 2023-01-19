import * as nodePath from 'path';

const buildFolder = `./dist`;
const srcFolder = `./src`;

export const path = {
  build: {
    fonts: `${buildFolder}/fonts/`,
    images: `${buildFolder}/img/`,
    js: `${buildFolder}/js/`,
    css: `${buildFolder}/css/`,
  },
  src: {
    svgicons: `${srcFolder}/img/svgicons/*svg`,
    images: `${srcFolder}/img/**/*.{jpg,jpeg,png,gif,webp}`,
    svg: `${srcFolder}/img/**/*.svg`,
    js: `${srcFolder}/js/app.js`,
    scss: `${srcFolder}/scss/style.sass`,
    files: `${srcFolder}/files/**/*.*`,
  },
  watch: {
    imges: `${srcFolder}/img/**/*.{jpg,jpeg,png,svg,gif,ico,webp}`,
    js: `${srcFolder}/js/**/*.js`,
    scss: `${srcFolder}/**/**/*.sass`,
    html: `${srcFolder}/**/*.pug`,
  },
  clean: buildFolder,
  buildFolder,
  srcFolder,
};