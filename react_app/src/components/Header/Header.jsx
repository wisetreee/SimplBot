import React, { useState, useEffect , useCallback} from 'react';

import  './Header.css';

const Header = ({ title }) => {
  
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

      fetch('https://simplbot.loca.lt/api/getBalance')
        .then((res) => res.json())
        .then((data) => {
          setBalance(data.balance);
      })


    

  }, []);




    return (
      <header className="Header">
        <h1>{title}</h1>
        {balance !== null ? <span>{balance}</span> : <span>Загрузка...</span>}
      </header>
    );
  };
  export default Header;