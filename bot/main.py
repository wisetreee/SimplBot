import telebot
from telebot import types
TOKEN = '7409866729:AAFOHZ51bByoojzbKA_5IDGT8MFb9oO3BYE'
bot = telebot.TeleBot(TOKEN)
bot.set_webhook()


msg_markup=types.InlineKeyboardMarkup() 
# shop_button = types.InlineKeyboardButton('Магазин',url="https://google.com/")
webUrl = types.WebAppInfo("https://github.com/wisetreee/SimplBot/blob/main/react-app/public/index.html")
shop_button = types.InlineKeyboardButton('Магазин',web_app=webUrl)
msg_markup.add(shop_button)


@bot.message_handler(commands=['start'])
def start(message):
    bot.send_message(message.chat.id, 'Заходи заебал', reply_markup=msg_markup)
   


bot.polling(non_stop=True)