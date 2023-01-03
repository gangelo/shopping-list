import * as React from 'react'
import * as ReactDOM from 'react-dom/client'

const Alert = (props) => {
  const type = props['type'];
  const message = props['message'];
  return (
    <div className={`alert alert-${type} alert-dismissible`} role="alert">
       <div>{message}</div>
       <button type="button" className="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
    </div>
  )
}

document.addEventListener('DOMContentLoaded', () => {
  const node = document.getElementById("alert");
  if (node === null) {
    return;
  }
  const type = node.getAttribute("data-type");
  const message = node.getAttribute("data-message");
  const root = ReactDOM.createRoot(node);
  root.render(<Alert type={type} message={message} />);
})

export default Alert
