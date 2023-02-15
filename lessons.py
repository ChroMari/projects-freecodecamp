# ~ 3 lesson ~
x = 6
print(x)

# ~ 4 lesson ~
x = 43
x = x + 1
print(x)

x = 5
if x < 10:
  print('Smaller')
if x > 20:
  print('Bigger')
print('Finish')

n = 5
while n > 0:
  print(n) # 5 4 3 2 1
  n = n - 1
print('Blastoff')

# ~ 6 lesson ~
width = 15
height = 12.0
print(height / 3) # 4.0 float + int => float

type(x) # выводит тип данной перменной <class 'int'> - в таком виде будет вывод в консоли типа данных
float(99) # из int делает преобразование в float тип данных
int('123') # из str делает преобразование в int тип данных

nam = input('Who are you?') # input выводит вопрос в консоли и ждёт, что введёт пользователь и не нажмёт Enter, сохраняя результат в переменную
print('Welcome', nam)

inp = input('Europe floor?')
usf = int(inp) + 1 # делаем перевод типа данных, так как input всегда возвращает данные в типе str
print('US floor', usf)

# ~ 7 lesson ~
x = 0
y = 0
if 0 == x:
  if y == 10:
    print("Yes")

# Оператор if
x = 5
if x < 10:
  print('Smaller')
if x > 20:
  print('Bigger')
print('Finish')

x = 5
if x == 5:
  print('Equals 5')
if x > 4:
  print('Greater than 4')
if x >= 5:
  print('Greater than or Equals 5')
if x < 6:
  print('Less than 6')
if x <= 5:
  print('Less than or Equals 5')
if x != 6:
  print('Not equal 6')

x = 4
if x > 2:
  print('Bigger')
else:
  print('Smaller')
print('All done')

# ~ 8 lesson ~
temp = "5 degrees"
cel = 0
fahr = float(temp)
cel = (fahr - 32.0) * 5.0 / 9.0
print(cel)

# try/except - конструкции
if x < 2:
  print('small')
elif x < 10:
  print('Medium')
else:
  print('LARGE')
print('All done')

astr = 'Hello Bob'
try:
  istr = int(astr)
except: # срабатывает только тогда, когда в коде что-то может пойти не так и будет ошибка
  istr = -1
print('First', istr)

# ~ 9 lesson ~
# Функции в питоне
def thing():
  print('Hello')
  print('Fun')

thing()
print('Zip')
thing()

# ~ 10 lesson ~
def greet(lang):
  if lang == 'es':
    print('Hola')
  elif lang == 'fr':
    print('Bonjour')
  else:
    print('Hello')

greet('en')
greet('es')
greet('fr')

def greet():
  return 'Hello'

print(greet(), 'Gleen')
print(greet(), 'Sally')

def addtwo(a, b):
  added = a + b
  return added

x = addtwo(3, 5)
print(x)

# ~ 11 lesson ~
n = 0
while True:
  if n == 3:
    break # выходит из внутреннего цикла, в место за циклом
  print(n)
  n = n + 1

continue # останавливает текущую итерацию и переходит к следующей

# ~ 12 lesson ~
for i in [2,1,5]:
  print(i)

for i in [5, 4, 3, 2, 1]:
  print(i) # 5 4 3 2 1 

friends = ['ab', 'cd', 'de']
for friend in friends:
  print('Happy ', friend) # выведит как если бы был цикл for => item[i]


