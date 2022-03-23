import {
  StyleSheet,
  Text,
  View,
  SafeAreaView,
  TouchableOpacity,
  FlatList,
  Image,
  Dimensions
} from "react-native";
import React, { useState } from "react";
import * as CATEGORY from "../data/CategeoryList";
import * as MENU from "../data/ItemList";
import * as COLOR from "../components/Colors";

import Title from "../components/Title";

const windowWidth = Dimensions.get("window").width;
const windowHeight = Dimensions.get("window").height;

const PrintScreen = ({ navigation, route }) => {
  const item = route.params;
  const [status, setStatus] = useState("All");
  const [dataList, setDataList] = useState(MENU.ItemList);

  const setStatusFilter = status => {
    if (status !== "All") {
      setDataList([...MENU.ItemList.filter(e => e.status === status)]);
    } else {
      setDataList(MENU.ItemList);
    }
    setStatus(status);
  };

  console.log(dataList, "tata slist");

  const renderItem = ({ item, index }) => {
    return (
      <TouchableOpacity>
        <View style={styles.itemList}>
          <Text style={styles.ItemListName}>
            {item.name}
          </Text>
          <Text>
            {item.price}
          </Text>
        </View>
      </TouchableOpacity>
    );
  };
  return (
    <SafeAreaView>
      <View style={styles.categoriesList}>
        {CATEGORY.CategoriesList.map(elements =>
          <TouchableOpacity
            style={[styles.btn, status === elements.status && styles.btnActive]}
            onPress={() => setStatusFilter(elements.status)}
          >
            <Text>
              {elements.status}
            </Text>
          </TouchableOpacity>
        )}
      </View>
      <View style={{ justifyContent: "center", alignItems: "center" }}>
        <FlatList
          showsVerticalScrollIndicator={false}
          data={dataList}
          keyExtractor={(item, index) => item.id}
          renderItem={renderItem}
        />
      </View>
    </SafeAreaView>
  );
};

export default PrintScreen;

const styles = StyleSheet.create({
  menuContainer: {
    justifyContent: "center",
    alignItems: "center",
    height: windowHeight * 0.78
  },
  menuView: {
    flex: 1,
    justifyContent: "center",
    alignItems: "center"
  },
  imageContainer: {
    justifyContent: "center",
    alignItems: "center"
  },
  imageStyle: {
    height: 64,
    width: 64
  },
  categoriesList: {},
  btn: {
    backgroundColor: "red"
  },
  btnActive: {
    backgroundColor: "green"
  },
  itemList: {
    flexDirection: "row",
    width: windowWidth * 0.8,
    backgroundColor: COLOR.BorderClo,
    padding: 14,
    margin: 4,
    borderRadius: 12,
    justifyContent: "flex-start",
    alignItems: "center"
  },
  ItemListName: {
    marginLeft: 20,
    width: 200
  }
});
