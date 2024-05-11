Данный скрипт позволяет избавиться от прописывать команды запуска игр по типу `HOST_LC_ALL=ru_RU.UTF-8 %command%`, `-rglLanguage ru-RU` и т.д., а так же избавляет от создания файла .txt с параметрами локализации, для запуска игр на родном языке в `Game mode`. Работает только с играми, которые поддерживают выбранные язык.<br/>
Не работает с играми, где локализацию нужно прописывать через реестр либо менять в файле steam_emu.ini/force_language.txt.<br/>
Демонстрационное видео https://www.youtube.com/watch?v=I-lFyo28PtI <br/>
Скрипт прописывает выбранную локализация.<br/>
Создает резервную копию файла, которую можно восстановить.<br/>
**ВНИМАНИЕ**! Для запуска данного скрипта нужен `sudo` пароль (пароль администратора). Если ранее пароль не был установлен, то это можно сделать через консоль, используя команду `passwd`.<br/>
P.S. Если этот скрипт вам помог, и вы хотите сказать спасибо, то это можно сделать по этой ссылке https://www.tinkoff.ru/cf/26UlfcEk1Jj ^^ <br/>
UPD:
Теперь у скрипта появился удобный интерфейс ^^<br/>
Добавлены иностранные локализации: Немецкий, Французский, Испанский, Испанский (Мексика), Итальянский, Португальский, Португальский (Бразилия), Китайский, Японский

## Смена локализации
## Установка
1. Тапнуть правой кнопкой на [LocaleFix.desktop](https://raw.githubusercontent.com/mashakulina/locale_fix_on_steamdeck/main/LocaleFix.desktop) 
2. Сохранить через `Save as` (`Сохранить ссылку как`) на рабочем столе

## Запуск
1. Тапнуть два раза на файл `LocaleFix.desktop`
2. Ввести `sudo` пароль в диалоговом окне
3. Выбрать нужную локализацию
4. Выбрать перезагрузить систему сейчас или позже (но систему обязательно нужно перезагрузить. Без этого локализация не будет активирована)

## Восстановление исходного файла
Восстанавливает исходный файл из bak файла. Удаляет старую версию файла.
### Установка
1. Тапнуть правой кнопкой на [LocaleFix.desktop](https://raw.githubusercontent.com/mashakulina/locale_fix_on_steamdeck/main/LocaleFix.desktop) 
2. Сохранить через `Save as` (`Сохранить ссылку как`) на рабочем столе

### Запуск
1. Тапнуть два раза на файл `LocaleFix.desktop`
2. Ввести `sudo` пароль во всплывшем окне
3. Выбрать `Recovery environment`
4. Выбрать перезагрузить систему сейчас или позже (но систему обязательно нужно перезагрузить. Без этого локализация не будет активирована)

## Дополнительно
После обновления Steam OS файл может быть сброшен до исходного состояния (если игра запустилась из Game mode на английском зяыке). В таком случае нужно повторить запуск `LocaleFix.desktop`.
