import React from'react';

const Header = ({ balance, title }) => {
    return (
      <header>
        <h1>{title}</h1>
        {balance !== null ? <span>{balance}</span> : <span>Загрузка...</span>}
      </header>
    );
  };
  export default Header;