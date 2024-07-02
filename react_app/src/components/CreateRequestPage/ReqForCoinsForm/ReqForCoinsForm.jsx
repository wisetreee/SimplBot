import React, { useEffect, useState } from 'react';
import './ReqForCoinsForm.css';


const ReqForCoinsForm = () => {
  const [achievements, setAchievements] = useState([]);
  const [selectedAchievement, setSelectedAchievement] = useState('');
  const [comment, setComment] = useState('');

  useEffect(() => {
    // Fetch achievements from the backend
    const fetchAchievements = async () => {
      try {
        const response = await fetch('https://simplbot.onrender.com/api/getAchievements');
        const data = await response.json();
        setAchievements(data);
      } catch (error) {
        console.error('Error fetching achievements:', error);
      }
    };

    fetchAchievements();
  }, []);


  // const SendCoinRequest =() => {
  //   coinRequest=
  //   {
  //     "id_user": ,


  //   }

    
  // }


  const handleAchievementChange = (event) => {
    setSelectedAchievement(event.target.value);
  };

  const handleCommentChange = (event) => {
    setComment(event.target.value);
  };

  const handleSubmit = (event) => {
    event.preventDefault();
    // Handle form submission logic
    console.log('Selected Achievement:', selectedAchievement);
    console.log('Comment:', comment);
  };

  return (
    <div>
    <p>Выберите достижение из списка</p>
    <form className="achievements-form" onSubmit={handleSubmit}>    
    
      {achievements.map((achievement) => (
        <label 
        key={achievement.id_achievement}
        className={`achievement-option ${selectedAchievement === achievement.id_achievement ? 'selected' : ''}`}>
          <input
            type="radio"
            name="achievement"
            value={achievement.id_achievement}
            checked={selectedAchievement === achievement.id_achievement}
            onChange={handleAchievementChange}
          />
          {achievement.name}
        </label>
      ))}
           
    </form>
    <p>Прикрепите доказательства наличия достижения</p>
      <textarea
        placeholder="Нажми, чтобы написать комментарий..."
        value={comment}
        onChange={handleCommentChange}
      />
    <button type="submit" className="submit-button">Отправить</button>
    </div>
  );
};

export default ReqForCoinsForm;