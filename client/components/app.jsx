import React from 'react';
import { Switch, Route } from 'react-router-dom';
import Home from './home';

const App = () => {
  const [user, setUser] = React.useState(null);
  const [userFetched, setUserFetched] = React.useState(false);

  const getUser = () => {
    fetch('/api/users')
      .then(response => response.json())
      .then(user => {
        setUserFetched(true);
        setUser(user);
      })
      .catch(error => console.error(error));
  };

  React.useEffect(() => getUser(), []);

  if (userFetched) {
    return (
      <Switch>
        <Route exact path="/" render={props =>
          <Home {...props} user={user} />} />
      </Switch>
    );
  } else return null;
};

export default App;
