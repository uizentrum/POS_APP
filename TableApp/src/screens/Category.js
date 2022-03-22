import {
  StyleSheet,
  Text,
  View,
  SafeAreaView,
  TouchableOpacity,
  FlatList
} from "react-native";
import React from "react";
import * as MENU from "../data/MenuList";
import MenuList from "../components/MenuList";
import Title from "../components/Title";

const Category = ({ navigation, route }) => {
  const item = route.params;
  return (
    <SafeAreaView>
      <View>
        <View>
        <Title  title={'Categories list'}/>

        </View>
        <View style={styles.menuContainer}>
      <Title  title={'Menu List'}/>

          <FlatList
            data={MENU.MenuList}
            numColumns={2}
            showsVerticalScrollIndicator={false}
              keyExtractor={item => item.name}
            renderItem={({ item }) =>
              <TouchableOpacity
                onPress={() => null}
              >
                <View style={styles.menuView}>
                  <MenuList value={item.name} price={item.price} />
                </View>
              </TouchableOpacity>}
          />
        </View>
      </View>
    </SafeAreaView>
  );
};

export default Category;

const styles = StyleSheet.create({
  menuContainer: {
    justifyContent: "center",
    alignItems: "center"
  },
  menuView: {
    justifyContent: "center",
    alignItems: "center"
  }
});
