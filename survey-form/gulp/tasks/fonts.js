import gulp from "gulp";
import { path } from "../config/path.js";
import fs from "fs";
import fonter from "gulp-fonter";
import ttf2woff2 from "gulp-ttf2woff2";

export const otfToTtf = () => {
  const srcFolder = path.srcFolder;

  return gulp
    .src(`${srcFolder}/fonts/*.otf`)
    .pipe(fonter({
      formats: ['ttf'], 
    }))
    .pipe(gulp.dest(`${srcFolder}/fonts/`));
};

/* Linux для woff файлов
  node_modules/gulp-fonter/dist/index.js строку newFont.path = source.dirname + '\\' + source.stem + '.' + тип; 
  изменить на: newFont.path = source.dirname + '/' + source.stem + '.' + тип; Я имею в виду '\\' изменить на '/'
*/

export const ttfToWoff2 = () => {
  const srcFolder = path.srcFolder;
  const buildFonts = path.build.fonts;

  return gulp
    .src(`${srcFolder}/fonts/*.ttf`, {})
    .pipe(fonter({ 
      formats: ['woff'], })
    )
    .pipe(gulp.dest(`${buildFonts}`))
    .pipe(gulp.src(`${srcFolder}/fonts/*.ttf`))
    .pipe(ttf2woff2())
    .pipe(gulp.dest(`${buildFonts}`));
};

 const numberFontWeight = {
  'thin': 100,
  'extralight': 200,
  'light': 300,
  'medium': 500,
  'semibold': 600,
  'bold': 700,
  'extrabold': 800,
  'heavy': 800,
  'black': 900
 };

export const fontsStyle = () => {
  let fontsFile = `${path.srcFolder}/fonts/fonts.scss`;
  const buildFonts = path.build.fonts;
  const srcFolder = path.srcFolder;

  fs.readdir(buildFonts, function (err, fontsFiles) {
    if (!fontsFiles) return;

    if (fs.existsSync(fontsFile)) {
      console.log("файл fonts/fonts.scss уже существует. для обновления файла нужно его удалить ");
      return;
    }

    fs.writeFile(fontsFile, '', () => {});

    let newFileOnly;

    for (let i = 0; i < fontsFiles.length; i++) {
      let fontFileName = fontsFiles[i].split('.')[0];

      if (newFileOnly !== fontFileName) {
        const fontName = fontFileName.split('-')[0] ? fontFileName.split('-')[0] : fontFileName;
        let fontWeight = fontFileName.split('-')[1] ? fontFileName.split('-')[1] : fontFileName;
        const weight = numberFontWeight[fontWeight.toLowerCase()];

        fontWeight = weight ? weight : 400;
        fs.appendFile(fontsFile, `@font-face {\n\tfont-family: ${fontName};\n\tfont-display: swap;\n\tsrc: url("../fonts/${fontFileName}.woff2") format("woff2"), url("../fonts/${fontFileName}.woff") format("woff");\n\tfont-weight: ${fontWeight};\n\tfont-style: normal;\n}\r\n`, () => {});
        newFileOnly = fontFileName;
      }
    }
  });

  return gulp.src(`${srcFolder}`);
}
