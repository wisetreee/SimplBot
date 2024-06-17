
import './App.css';
import { useEffect } from 'react';
import { BrowserRouter as Router, Route, Routes } from 'react-router-dom';

import MainPage from './components/MainPage/MainPage';


function App() {

useEffect (()=> {
  tg.ready();
}, [])




return (
  <Router>
    <Routes>
      <Route path="/" element={<MainPage />} />
      {/* <Route path="/create" element={<CreateRequestPage />} /> */}
    </Routes>
  </Router>
);


}

export default App;