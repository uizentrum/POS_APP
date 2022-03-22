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

const data = [
  {
    id: "1",
    title: "Table 1",
    image: "https://img.icons8.com/doodle/96/000000/car--v1.png"
  },
  {
    id: "2",
    title: "Table 2",
    image: "https://img.icons8.com/office/80/000000/kawaii-french-fries.png"
  },
  {
    id: "3",
    title: "Table 3",
    image: "https://img.icons8.com/office/80/000000/kawaii-french-fries.png"
  },
  {
    id: "4",
    title: "Table 4",
    image: "https://img.icons8.com/office/80/000000/kawaii-french-fries.png"
  },
  {
    id: "5",
    title: "Table 5",
    image: "https://img.icons8.com/office/80/000000/kawaii-french-fries.png"
  },
  {
    id: "6",
    title: "Table 6",
    image: "https://img.icons8.com/office/80/000000/kawaii-french-fries.png"
  },
  {
    id: "7",
    title: "Table 7",
    image: "https://img.icons8.com/office/80/000000/kawaii-french-fries.png"
  },
  {
    id: "8",
    title: "Table 8",
    image: "https://img.icons8.com/office/80/000000/kawaii-french-fries.png"
  },
  {
    id: "9",
    title: "Table 9",
    image: "https://img.icons8.com/office/80/000000/kawaii-french-fries.png"
  },
  {
    id: "10",
    title: "Table 10",
    image: "https://img.icons8.com/office/80/000000/kawaii-french-fries.png"
  }
];

const HomeScreen = ({ navigation }) => {
  return (
    <SafeAreaView>
      <View style={styles.container}>
        <View>
          <Title title={'List of Tables'}/>
        </View>
        <FlatList
          data={data}
          numColumns={2}
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
