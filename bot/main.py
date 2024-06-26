import telebot
import DBService
from telebot import types
from flask import Flask, request, jsonify
from flask_cors import CORS
from DBService import p
app = Flask(__name__, static_folder="react_app") # инициализация Flask-приложения
CORS(app) 

@app.route('/api/getBalance', methods=['GET']) # При запросе на https://simplbot.loca.lt/api/getBalance возвращается JSON-файл со значением 40
def get_balance():
   id = int(request.args.get('user_id'))
   balance = DBService.get_balance(id)[0] # Метод возвращает список словарей. Что делать, если строк в таблице несколько для одного айдишника?
   return jsonify(balance)




TOKEN = '7409866729:AAFOHZ51bByoojzbKA_5IDGT8MFb9oO3BYE'
bot = telebot.TeleBot(TOKEN)
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
   bot.delete_message(message.chat.id, message.message_id)

@bot.message_handler(commands=['app'])
def app(message):
   bot.send_message(message.chat.id, 'Ссылка на магазин ', reply_markup=webAppMessageButton())
   bot.delete_message(message.chat.id, message.message_id)

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
    app.run(debug=True, port=5000)