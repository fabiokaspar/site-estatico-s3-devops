// import logo from './logo.svg';
import './App.css';
import leao from './leao.jpg';

function App() {
  return (
    <div className="App">
      <header className="App-header">
        <img src={leao} className="App-logo" alt="logo" />
        <p>
          Curso Terraform com AWS (DevOps)
        </p>
        <a
          className="App-link"
          href="https://reactjs.org"
          target="_blank"
          rel="noopener noreferrer"
        >
          Learn React
        </a>
      </header>
    </div>
  );
}

export default App;
