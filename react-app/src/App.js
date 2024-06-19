
import './App.css';
import { useEffect } from 'react';
import { BrowserRouter as Router, Route, Routes } from 'react-router-dom';
import {UseTelegram} from "./hooks/UseTelegram";
import MainPage from './components/MainPage/MainPage';

function App() {
  const {tg} = useTelegram();
useEffect (()=> {
  tg.ready();
}, [])




return (
<div className="App">
  <h1>eer</h1>

    {/* <Routes> */}
      {/* <Route path="/" element={<MainPage />} /> */}
      {/* <Route path="/create" element={<CreateRequestPage />} /> */}
     {/* </Routes> */}
</div>
);


}

export default App;