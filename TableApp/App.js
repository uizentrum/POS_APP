import * as React from "react";
import { NavigationContainer } from "@react-navigation/native";
import StackScreen from "./src/stackNavigation/StackScreen";

const App = () => {
  return (
    <NavigationContainer>
      <StackScreen/>
    </NavigationContainer>
  );
};

export default App;
