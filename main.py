import telebot

TOKEN = '7409866729:AAFOHZ51bByoojzbKA_5IDGT8MFb9oO3BYE'
bot = telebot.TeleBot('7409866729:AAFOHZ51bByoojzbKA_5IDGT8MFb9oO3BYE')
bot.set_webhook()


@bot.message_handler(commands=['start'])
def main(message):
    bot.send_message(message.chat.id, 'Здарова заебал')

bot.polling(non_stop=True)