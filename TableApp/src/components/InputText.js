import React from "react";
import {
  StyleSheet,
  Text,
  View,
  TextInput,
  TouchableOpacity,
  Dimensions
} from "react-native";
import { Feather, MaterialIcons } from "@expo/vector-icons";

import { IconClo, BorderClo } from "./Colors";
import * as COLOR from "./Colors";

const windowWidth = Dimensions.get("window").width;
const windowHeight = Dimensions.get("window").height;

const InputText = ({ navigation, placeholder, label, icon, onChangeText }) => {
  return (
    <View style={styles.container}>
      <Text style={styles.text}>
        {label}
      </Text>
      <View
        style={{
          justifyContent: "space-between",
          flexDirection: "row"
        }}
      >
        <TextInput
          style={styles.txtinpt}
          placeholder={placeholder}
          onChangeText={onChangeText}
        />

        <TouchableOpacity>
          <MaterialIcons
            name={icon}
            size={24}
            color="#708090"
            style={styles.icon}
          />
        </TouchableOpacity>
      </View>
    </View>
  );
};

export default InputText;

const styles = StyleSheet.create({
  container: {
    backgroundColor: COLOR.IconClo,
    borderRadius: 10,
    shadowColor: COLOR.SHADOWCOLOR,
    shadowOpacity: 0.3,
    shadowOffset: { width: 2, height: 4 },
    shadowRadius: 3,
    width: '60%',
    height:50,
    margin: 5
  },

  txtinpt: {
    marginHorizontal: 3,
    height: 35,
    fontSize: 18,
    paddingLeft: 10,
    shadowColor: COLOR.SHADOWCOLOR,
    shadowOpacity: 0.3,
    shadowOffset: { width: 2, height: 4 },
    shadowRadius: 3
  },
  text: {
    marginTop: 2,
    marginLeft: 10
  },
  icon: {
    marginRight: 10,
    marginTop: 5
  }
});
