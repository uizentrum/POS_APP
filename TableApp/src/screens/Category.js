import {
  StyleSheet,
  Text,
  View,
  SafeAreaView,
  TouchableOpacity,
  FlatList
} from "react-native";
import React from "react";
import *as MENU from '../data/MenuList'

const Category = ({ navigation, route }) => {
    const { item } = route.params;
  return (
    <SafeAreaView>
      <View>
        <Text>{item.id}</Text>
        <Text>{item.title}</Text>

        <TouchableOpacity onPress={() => navigation.goBack()}>
          <Text>go back </Text>
        </TouchableOpacity>
      </View>
      <View>
      <FlatList
          data={MENU.MenuList}
          numColumns={2}
          keyExtractor={item => item.name}
          renderItem={({ item }) =>
            <TouchableOpacity
              onPress={() => navigation.navigate("Categories", { item })}
            >
              <View style={styles.tableView}>
                <Text>
                  {item.name}
                </Text>
              </View>
            </TouchableOpacity>}
        />
      </View>
    </SafeAreaView>
  );
};

export default Category;

const styles = StyleSheet.create({});
