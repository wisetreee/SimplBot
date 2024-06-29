import os
import telebot
import DBService
from telebot import types
from flask import Flask, request, jsonify
from flask_cors import CORS
from configparser import ConfigParser
import json

app = Flask(__name__, static_folder="react_app") # инициализация Flask-приложения
CORS(app) 
host = os.getenv('FLASK_HOST', '127.0.0.1')
port = os.getenv('FLASK_PORT', '5000')

@app.route('/')
def hello():
   return 'hello world'



@app.route('/api/getBalance', methods=['GET']) # При запросе на https://simplbot.loca.lt/api/getBalance возвращается JSON-файл со значением 40
def get_balance():
   id = int(request.args.get('user_id'))
   balance = DBService.get_balance(id)[0] # Метод возвращает список словарей. Что делать, если строк в таблице несколько для одного айдишника?
   return jsonify(balance)

with open('config.json') as file:
    token = json.load(file) 
    bot_token = token['TOKEN']
    
# парсер не может строку распарсить с URL БД    
# config = ConfigParser()
# config.read('bot/config.ini')
# bot_token = config['DEFAULT']['TOKEN']

bot = telebot.TeleBot(bot_token)
bot.set_webhook()
webAppLink = types.WebAppInfo("https://frontend--singular-melba-c0caef.netlify.app/") #ссылка на наше веб-приложение

# ----------------------


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


@bot.message_handler(commands=['start'])
def start(message):
   bot.send_message( message.chat.id, 'Привет, я SimplBot, твой помощник для работы c валютой SimplCoin!\nЗапустить приложение можно по кнопке ниже или с помощью команды /app.',parse_mode="Markdown", reply_markup=webAppKeyboard())
   # bot.delete_message(message.chat.id, message.message_id)

@bot.message_handler(commands=['app'])
def app(message):
   bot.send_message(message.chat.id, 'Ссылка на магазин ', reply_markup=webAppMessageButton())
 #  bot.delete_message(message.chat.id, message.message_id)

# @bot.message_handler(commands=['sql'])
# def sql(message):
#    bot.send_message(message.chat.id, data)
#    bot.delete_message(message.chat.id, message.message_id)

@bot.message_handler(content_types='text')
def deny(message):
    bot.delete_message(message.chat.id, message.message_id)
    bot.send_message(message.chat.id, "Такой команды не существует.")



bot.polling(non_stop=True)

if __name__ == '__main__':

   app.run(host=host, port=int(port))
   #  app.run(debug=True, port=5000)