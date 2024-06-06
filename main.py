import telebot

TOKEN = '7409866729:AAFOHZ51bByoojzbKA_5IDGT8MFb9oO3BYE'
bot = telebot.TeleBot('7409866729:AAFOHZ51bByoojzbKA_5IDGT8MFb9oO3BYE')
bot.set_webhook()


@bot.message_handler(commands=['start'])
def main(message):
    bot.send_message(message.chat.id, 'Здарова заебал')
    bot.send_message(message.chat.id, 'кукубиби')
    bot.send_message(message.chat.id, 'хабиби хамуда')

bot.polling(non_stop=True)
a=5