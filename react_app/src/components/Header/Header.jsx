import React, { useState, useEffect , useCallback} from 'react';
import {UseTelegram} from "/src/hooks/UseTelegram";
import  './Header.css';




const Header = ({ title }) => {
const {tg} = UseTelegram();


 const [balance, setBalance] = useState(null);  
  useEffect(() => { //при обновлении страницы будет вычисляться баланс


    // const fetchBalance = async () => {
    //   try {
    //     const response = await fetch('https://simplbot.loca.lt/api/getBalance');
    //     if (!response.ok) {
    //       throw new Error('Network response was not ok');
    //     }
    //     const data = await response.json();     
    //     setBalance(data.balance);
    //   } catch (error) {
    //     console.error('Fetch error: ', error);
    //   }
    // };

      fetch('https://simplbot.onrender.com/api/getBalance')
        .then((res) => res.json())
        .then((data) => {
          setBalance(data.balance);
      })


    

  }, []);




    return (
      <header className="Header">
        <span>{tg.initDataUnsafe?.user?.username}</span>
        {balance !== null ? <span>{balance}</span> : <span>Загрузка...</span>}
        <h1>{title}</h1>
        
      </header>
    );
  };
  export default Header;