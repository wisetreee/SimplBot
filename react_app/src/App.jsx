
import './App.css';
import { useEffect } from 'react';
import { BrowserRouter as Router, Route, Routes } from 'react-router-dom';
import {UseTelegram} from "./hooks/UseTelegram";
import MainPage from './components/MainPage/MainPage.jsx';

function App() {
  const {tg} = UseTelegram();

  
useEffect (()=> {
  tg.ready();
}, [])




return (
  
<div className="App">

    <Routes>
      <Route index element={<MainPage />} />
      {/* <Route path="/create" element={<CreateRequestPage />} /> */}
       {/* <Route index element={<div>No page is selected.</div> } /> */}
     </Routes>

</div>
);


}

export default App;