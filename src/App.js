// import logo from './logo.svg';
import './App.css';
import jim from './jim.gif';

function App() {
  return (
    <div className="App">
      <header className="App-header">
        <img src={jim} className="App-logo" alt="logo" />
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
