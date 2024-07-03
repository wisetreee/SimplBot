import React, { useState, useEffect } from 'react';
import { useNavigate } from 'react-router-dom';
import Header from '../Header/Header';
// import  './MainPage.css';

const MainPage = () => {

  const navigate = useNavigate();


  
  return (
    <div>
      
      <Header title="Мои заявки" />
      <button onClick={() => navigate('/create')}>Создать заявку</button>
      <p>Тут пусто...пока</p>
    </div>
  );
};

export default MainPage;