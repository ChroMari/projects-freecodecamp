const path = require('../../path');

module.exports = (isDev) => !isDev ? {} : ({
  devServer: { // подключение сервера для работы
    port: 4200,
    open: '/index.html',
    hot: true,
    contentBase: path.join(__dirname, 'public') // указываем путь до папки со статическими файлами
  }
});
