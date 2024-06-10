import telebot
from telebot import types
import psycopg2


try:
    connection = psycopg2.connect(
        host='localhost',
        user='postgres',
        password='123',
        database='SimplDB'
      )
    with connection.cursor() as cursor:
        cursor.execute("SELECT version();")
        print(f"Server version {cursor.fetchone()}")
except Exception as _ex:
    print('Error with work PostgreSQL',_ex)


# ----------------------
TOKEN = '7409866729:AAFOHZ51bByoojzbKA_5IDGT8MFb9oO3BYE'
bot = telebot.TeleBot(TOKEN)
bot.set_webhook()

webAppLink = types.WebAppInfo("https://github.com/wisetreee/SimplBot/blob/main/react-app/public/index.html") #ссылка на наше веб-приложение

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
   bot.send_message( message.chat.id, 'Привет, я SimplBot, твой помощник для работы c валютой SimplCoin!\nЗапустить приложение можно по кнопке ниже или с помощью команды /app.', parse_mode="Markdown", reply_markup=webAppKeyboard())
   bot.delete_message(message.chat.id, message.message_id)

@bot.message_handler(commands=['app'])
def app(message):
   bot.send_message(message.chat.id, 'Ссылка на магазин', reply_markup=webAppMessageButton())
   bot.delete_message(message.chat.id, message.message_id)

@bot.message_handler(content_types='text')
def deny(message):
    bot.delete_message(message.chat.id, message.message_id)
    bot.send_message(message.chat.id, "Такой команды не существует.")

bot.polling(non_stop=True)