import React from "react";
import {
  StyleSheet,
  Text,
  View,
  TextInput,
  TouchableOpacity,
  Dimensions
} from "react-native";
import { Feather } from "@expo/vector-icons";


import { IconClo, BorderClo } from "./Colors";
import * as COLOR from "./Colors";

const windowWidth = Dimensions.get("window").width;
const windowHeight = Dimensions.get("window").height;

const SearchComponent = () => {
  return (
    <View style={styles.container}>
      <TextInput style={styles.txtinpt} placeholder="Search" />
      <TouchableOpacity style={styles.bttn}>
        <Feather name="search" style={styles.icon} />
        
      </TouchableOpacity>
    </View>
  );
};

export default SearchComponent;

const styles = StyleSheet.create({
  container:{
    justifyContent:'center',
    alignItems:'center',
    flexDirection:'row',
    backgroundColor: COLOR.IconClo,
    borderRadius:10,
    shadowColor: COLOR.SHADOWCOLOR,
    shadowOpacity:0.3,
    shadowOffset:{width:2, height:4},
    shadowRadius:3,
 
  },
  bttn: {
    shadowColor: COLOR.SHADOWCOLOR,
    shadowOpacity:0.3,
    shadowOffset:{width:2, height:4},
    shadowRadius:3,
  },
  txtinpt: {
    marginHorizontal: 5,
    width: windowWidth * 0.8,
    height: windowHeight * 0.07,
    fontSize:18,
    paddingLeft:10,
    shadowColor: COLOR.SHADOWCOLOR,
    shadowOpacity:0.3,
    shadowOffset:{width:2, height:4},
    shadowRadius:3,
  },
  icon:{
    marginRight:10,
    fontSize:24,
    shadowColor: COLOR.SHADOWCOLOR,
    shadowOpacity:0.3,
    shadowOffset:{width:2, height:4},
    shadowRadius:3,
  }
});
