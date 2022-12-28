import * as React from 'react'
import * as ReactDOM from 'react-dom/client'

/* Functional vs. class components */
const Welcome = () => {
  return (
    <div className="container">
      Some message.
    </div>
  )
}

document.addEventListener('DOMContentLoaded', () => {
    const root = ReactDOM.createRoot(
      document.getElementById('welcome')
    );

    root.render(<Welcome />);
})

export default Welcome
