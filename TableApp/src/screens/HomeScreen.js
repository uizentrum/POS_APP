import {
  StyleSheet,
  Text,
  View,
  SafeAreaView,
  TouchableOpacity,
  FlatList,
  Image
} from "react-native";
import React from "react";
import * as COLOR from "../components/Colors";
import Title from "../components/Title";
import  *as TABLE from '../data/TablesList'
import Icon from 'react-native-vector-icons/EvilIcons';


const HomeScreen = ({ navigation }) => {
  return (
    <SafeAreaView>
      <View style={styles.container}>
        <View>
          <Title title={'List of Tables'}/>
          <Icon name="rocket" size={30} color="#900" />
        </View>
        <FlatList
          data={TABLE.TablesList}
          numColumns={2}
          scrollEnabled={false}
          //   horizontal
          keyExtractor={item => item.id}
          renderItem={({ item }) =>
            <TouchableOpacity
              onPress={() => navigation.navigate("Categories", { item })}
            >
              <View style={styles.tableView}>
                <Text>
                  {item.title}
                </Text>
              </View>
            </TouchableOpacity>}
        />
      </View>
     
    </SafeAreaView>
  );
};

export default HomeScreen;

const styles = StyleSheet.create({
  container: {
    justifyContent: "center",
    alignItems: "center",
    marginTop: 20
  },
  tableView: {
    backgroundColor: COLOR.TABLE_BACKGROUND,
    margin: 5,
    padding: 5,
    height: 120,
    width: 120,
    borderRadius: 40,
    justifyContent: "center",
    alignItems: "center",
    borderColor: COLOR.BorderClo,
    borderWidth: 2,
    shadowColor: COLOR.SHADOWCOLOR,
    shadowOpacity: 0.3,
    shadowOffset: { width: 2, height: 4 },
    shadowRadius: 3
  }
});
