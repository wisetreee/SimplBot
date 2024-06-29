import React, { useState, useEffect } from 'react';
import { useNavigate } from 'react-router-dom';
import Header from '../Header/Header';

const CreateRequestPage = () => {

    const navigate = useNavigate();
  
  
    
    return (
      <div>
        
        <Header title="Мои заявки" />
        <Button text="Создать заявку" onClick={() => navigate('/')}/>
        
        <p className='empty'>Тут пусто...пока</p>
        
      </div>
    );
  };
  
  export default CreateRequestPage;