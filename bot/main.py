import os
import telebot
import DBService
from telebot import types
from flask import Flask, request, jsonify
from flask_cors import CORS
from configparser import ConfigParser
import json
from waitress import serve
from threading import Thread

app = Flask(__name__, static_folder="react_app") # инициализация Flask-приложения
CORS(app) 

# Конфигурация

# # host = os.getenv('FLASK_HOST', '127.0.0.1')
# port = os.getenv('FLASK_PORT', '5000')
TOKEN="7409866729:AAFOHZ51bByoojzbKA_5IDGT8MFb9oO3BYE"
URL="https://simplbot.onrender.com/"


bot = telebot.TeleBot(TOKEN)
webAppLink = types.WebAppInfo("https://frontend--singular-melba-c0caef.netlify.app/") #ссылка на наше веб-приложение

# Маршрут для установки вебхука
@app.route('/')
def webhook():
    bot.remove_webhook()
    bot.set_webhook(url=URL + TOKEN)
    return "Webhook set!", 200

# Маршрут для обработки вебхуков
@app.route('/' + TOKEN, methods=['POST'])
def getMessage():
    json_string = request.get_data().decode('utf-8')
    update = telebot.types.Update.de_json(json_string)
    bot.process_new_updates([update])
    return "!", 200

@app.route('/api/getBalance', methods=['GET']) # При запросе на "https://simplbot.onrender.com/" возвращается JSON-файл
def get_balance():
   id = int(request.args.get('user_id'))
   balance = DBService.get_balance(id)[0] # Метод возвращает список словарей. Что делать, если строк в таблице несколько для одного айдишника?
   return jsonify(balance)

# # with open('config.json') as file:
# #     token = json.load(file) 
# #     bot_token = token['TOKEN']
    
# # парсер не может строку распарсить с URL БД    
# # config = ConfigParser()
# # config.read('bot/config.ini')
# # bot_token = config['DEFAULT']['TOKEN']



# # ----------------------


def webAppMessageButton(): 
   msg_markup=types.InlineKeyboardMarkup() 
   button = types.InlineKeyboardButton(text="💰💰💰", web_app=webAppLink) 
   msg_markup.add(button)
   return msg_markup

def webAppKeyboard():
   keyboard = types.ReplyKeyboardMarkup(row_width = 1, resize_keyboard=True)
   button = types.KeyboardButton(text="Магазин", web_app=webAppLink)
   keyboard.add(button)
   return keyboard


# Обработчик команд бота

@bot.message_handler(commands=['start'])
def start(message):
   bot.send_message( message.chat.id, 'Привет, я SimplBot, твой помощник для работы c валютой SimplCoin!\nЗапустить приложение можно по кнопке ниже или с помощью команды /app.',parse_mode="Markdown", reply_markup=webAppKeyboard())
    # bot.delete_message(message.chat.id, message.message_id)

@bot.message_handler(commands=['app'])
def app(message):
  bot.send_message(message.chat.id, 'Ссылка на магазин ', reply_markup=webAppMessageButton())
 #  bot.delete_message(message.chat.id, message.message_id)







def run_flask():
    port = int(os.getenv('PORT', 5000))
    serve(app, host='0.0.0.0', port=port)

if __name__ == '__main__':
    # Запуск Flask и бота параллельно
    flask_thread = Thread(target=run_flask)
    flask_thread.start()

    # bot.remove_webhook()
    # bot.set_webhook(url=URL + TOKEN)

    # Запуск бота в режиме polling для обработки сообщений
   #  bot.polling(none_stop=True)
