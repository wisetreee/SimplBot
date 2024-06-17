const tg = window.Telegram.WebApp;

export function UseTelegram() {

    const TgClose =() => {
        tg.close()
      }

      const ToggleMainButton =() => {
        if (tg.MainButton.isVisible) {
            tg.MainButton.hide();
        }
        else {
            tg.MainButton.show();
        }

      }

      return {
        TgClose,
        ToggleMainButton,
        tg,
        user: tg.initDataUnsafe?.user,
      }
}

//TODO: добавить атрибуты пользователя, зашедшего в приложение (имя, фамилия, ник, id)