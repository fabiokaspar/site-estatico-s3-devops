// import logo from './logo.svg';
import './App.css';
import leao from './leao.jpg';

function App() {
  return (
    <div className="App">
      <header className="App-header">
        <img src={leao} className="App-logo" alt="logo" />
        <h1>
          FrontEnd CI/CD
        </h1>
        <a
          className="App-link"
          href="https://d3ahbqwjqepu45.cloudfront.net/"
          target="_blank"
          rel="noopener noreferrer"
        >
          Link CloudFront Domain
        </a>
      </header>
    </div>
  );
}

export default App;
