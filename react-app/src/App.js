
import './App.css';
import { useEffect } from 'react';
const tg = window.Telegram.WebApp;

function App() {

useEffect (()=> {
  tg.ready();
}, [])


const OnClose =() => {
  tg.close()
}

  return (
    <div className="App">
      Добро пожаловать!
      <button onClick={OnClose}>Закрыть</button>
    </div>
  );
}

export default App;
