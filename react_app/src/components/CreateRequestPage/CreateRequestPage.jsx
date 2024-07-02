import React, { useState, useEffect } from 'react';
import { useNavigate } from 'react-router-dom';
import Header from '../Header/Header';
import Button from '../Button/Button';
const CreateRequestPage = () => {

    const navigate = useNavigate();
  
  
    
    return (
      <div>
        
        <Header title="Новая заявка" />
        <Button text="Создать заявку" onClick={() => navigate('/')}/>
        
        <p className='empty'>Тут пусто...пока</p>
        
      </div>
    );
  };
  
  export default CreateRequestPage;