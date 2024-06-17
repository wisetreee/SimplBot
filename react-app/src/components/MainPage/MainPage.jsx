import React, { useState, useEffect } from 'react';
import { useNavigate } from 'react-router-dom';
import Header from './Header';



const MainPage = () => {
  const [balance, setBalance] = useState(null); //Функция, подсчитывающая баланс
  const navigate = useNavigate();

  useEffect(() => { //при обновлении страницы будет вычисляться баланс
    const fetchBalance = async () => {
      try {
        const response = await fetch('http://localhost:5000/api/getBalance');
        if (!response.ok) {
          throw new Error('Network response was not ok');
        }
        const data = await response.json();
        setBalance(data.balance);
      } catch (error) {
        console.error('Fetch error: ', error);
      }
    };

    fetchBalance();
  }, []);

  return (
    <div>
      <Header balance={balance} title="Мои заявки" />
      <button onClick={() => navigate('/create')}>Создать заявку</button>
      <p>Тут пусто...пока</p>
    </div>
  );
};

export default MainPage;